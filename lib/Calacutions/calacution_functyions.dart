import 'dart:developer';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/dummy/dummy.dart';
import 'package:haptic_fone/googleanimation/anitomtest.dart';
import 'package:haptic_fone/screens/HOME/bottomuser.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

void upadtedtotalprice(
    TextEditingController controlleritemcount,
    TextEditingController controlertotalprcie,
    String convertsaleprice,
    String convertPurshcseamount) {
  int itemcount = int.parse(controlleritemcount.text);
  double mulipedprice = double.parse(convertsaleprice);
  double totalprice = itemcount * mulipedprice;
  controlertotalprcie.text = totalprice.toStringAsFixed(2);
}

void upadtedtotalprice1(TextEditingController controlleritemcount,
    TextEditingController controlertotalprcie, String convertPurshcseamount) {
  int itemcount = int.parse(controlleritemcount.text);
  double pusrschaemount = double.parse(convertPurshcseamount);
  double totalprice1 = itemcount * pusrschaemount;
  controlertotalprcie.text = totalprice1.toStringAsFixed(2);
}

class SetReady {
  static Future<void> handleSale({
    required int invoicenumber,
    required TextEditingController phonenumber,
    required Function(Map<String, dynamic>) onAddSale,
    required List<Map<String, dynamic>> saleitu,
    required TextEditingController emplyename,
    required BuildContext context,
  }) async {
    if (emplyename.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Employee name is required")),
      );
      return; // If validation fails, exit early
    }
    if (phonenumber.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Phone number name is required")));
      return;
    }

    int currentInvoiceNumber = await _getInvoiceNumber();

    // Update invoice number
    int updatedInvoiceNumber = currentInvoiceNumber + 1;
    await _saveInvoiceNumber(updatedInvoiceNumber);

    await processSaleItem(
      invoiceno: updatedInvoiceNumber,
      phonenumber: phonenumber,
      item: saleitu,
      emplyename: emplyename,
      onAddSale: onAddSale,
      // ignore: use_build_context_synchronously
      context: context,
    );
    // Iterate through each sale item
  }

  static Future<int> _getInvoiceNumber() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getInt('invoiceNumber') ?? 0; // Default to 1 if not set
  }

  static Future<void> _saveInvoiceNumber(int invoiceNumber) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('invoiceNumber', invoiceNumber);
  }

  static Future<void> processSaleItem({
    required int invoiceno,
    required TextEditingController phonenumber,
    required List<Map<String, dynamic>> item,
    required TextEditingController emplyename,
    required Function(Map<String, dynamic>) onAddSale,
    required BuildContext context,
  }) async {
    List<Saleitems> saleList = [];
    final opebbox = Hive.box<List<dynamic>>("saleadd_box");
    // final box = Hive.box<Saleitems>("saleadd_box");
    List<Saleitems>? box = opebbox.get('saleKey')?.cast<Saleitems>();
    if (box != null) {
      saleList = box;
    }
    try {
      for (var i = 0; i < item.length; i++) {
        final saleItem = Saleitems(
            invoiceno: invoiceno.toString(),
            phonenumber: phonenumber.text,
            saleHivebrand: item[i]["brand"] ?? "Unknown Brand",
            saleHivemodel: item[i]["Model"] ?? "Unknown Model",
            saleHiveColor: item[i]["Color"]?.toString() ?? "Unknown Color",
            saleHiveStroage:
                item[i]["Straoge"]?.toString() ?? "Unknown Storage",
            saleHiveCondtion:
                item[i]["Condtion"]?.toString() ?? "Unknown Condition",
            saleHiveitemcount: item[i]["itemcount"]?.toString() ?? "0",
            saleHiveprice: item[i]["Price"]?.toString() ?? "0",
            saleimgpath: item[i]["Image"],
            empolye: emplyename.text,
            salepurshaceamount: item[i]["PurshcePrice"]?.toString() ?? "",
            saledate: DateTime.now().toString());

        if ([
          saleItem.saleHivebrand,
          saleItem.saleHiveitemcount,
          saleItem.saleHiveprice,
          saleItem.saleHiveCondtion
        ].any((field) => field.isEmpty)) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    "Missing required fields for ${saleItem.saleHivemodel}")),
          );
          return;
        }

        // Open Hive stock box
        final stockbox = await Hive.openBox<StockItems>("stockitem_box");
        final stockitem = stockbox.values.firstWhere(
          (stock) =>
              stock.hivemodel == saleItem.saleHivemodel &&
              stock.hivebrand == saleItem.saleHivebrand,
          orElse: () => StockItems(
            hiveimg: Uint8List(0),
            hivebrand: "",
            hivemodel: "",
            hivecolor: "",
            hivestorage: "",
            hivecondtion: "",
            hiveitemcount: "0",
            hiveprice: "",
            purschaseprice: "",
          ),
        );

        if (stockitem.hivemodel.isEmpty) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    "Item not found in stock: ${saleItem.saleHivemodel}}")),
          );
          return;
        }

        // Validate stock count
        final stockreduce = int.tryParse(stockitem.hiveitemcount) ?? 0;
        final salecount = int.tryParse(saleItem.saleHiveitemcount) ?? 0;

        if (salecount > stockreduce) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content:
                    Text("Insufficient stock for ${saleItem.saleHivemodel}")),
          );
          return;
        }

        // Update stock
        final updatedStock = stockreduce - salecount;
        stockbox.put(
          stockitem.key,
          StockItems(
            hiveimg: stockitem.hiveimg,
            hivebrand: stockitem.hivebrand,
            hivemodel: stockitem.hivemodel,
            hivecolor: stockitem.hivecolor,
            hivestorage: stockitem.hivestorage,
            hivecondtion: stockitem.hivecondtion,
            hiveitemcount: updatedStock.toString(),
            hiveprice: stockitem.hiveprice,
            purschaseprice: stockitem.purschaseprice,
          ),
        );

        saleList.add(saleItem);
      }
      final saleBox = await Hive.openBox<List<dynamic>>("saleadd_box");

      final List<Saleitems> saleAddModel = [];
      for (var element in saleList) {
        saleAddModel.add(Saleitems(
            invoiceno: element.invoiceno,
            phonenumber: element.phonenumber,
            saleHivebrand: element.saleHivebrand,
            saleHivemodel: element.saleHivemodel,
            saleHiveColor: element.saleHiveColor,
            saleHiveStroage: element.saleHiveStroage,
            saleHiveCondtion: element.saleHiveCondtion,
            empolye: element.empolye,
            saleHiveitemcount: element.saleHiveitemcount,
            saleHiveprice: element.saleHiveprice,
            saleimgpath: element.saleimgpath,
            salepurshaceamount: element.salepurshaceamount,
            saledate: element.saledate));
      }

      await saleBox.put("saleKey", saleAddModel);

      // Call callback function
      // Navigate to Success Screen
      Navigator.of(context).pushAndRemoveUntil(
        PageRouteBuilder(
          pageBuilder: (context, animation, secondaryAnimation) =>
              SuccessScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0);
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween =
                Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            var offsetAnimation = animation.drive(tween);

            return SlideTransition(
              position: offsetAnimation,
              child: child,
            );
          },
        ),
        (Route<dynamic> route) => false,
      );
      Dummy.addmuiltsale.clear();
      // Wait and navigate to Home
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Bottomuser(selecteddindex: 1),
        ),
      );
    } catch (e, stackTrace) {
      log(e.toString());
      print("Error processing item: $item. Exception: $e");
      print(stackTrace);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("An error occurred for ")),
      );
    }
  }
}
