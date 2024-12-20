import 'dart:io';
import 'dart:typed_data';

import 'package:haptic_fone/database/db_stockitems.dart';

import 'package:hive/hive.dart';

Future<void> addStock(
    {required Uint8List image,
    required String brand,
    required String model,
    required String color,
    required String storage,
    required String condition,
    required String itemCount,
    required String price,
    required Function(Map<String, dynamic>) onAddStock,
    required String purshscaeprice}) async {
  final box = Hive.box<StockItems>("stockitem_box");

  final newStock = StockItems(
      hiveimg: image,
      hivebrand: brand,
      hivemodel: model,
      hivecolor: color,
      hivestorage: storage,
      hivecondtion: condition,
      hiveitemcount: itemCount,
      hiveprice: price,
      purschaseprice: purshscaeprice);

  box.add(newStock);

  onAddStock({
    "image": image,
    "brand": brand,
    "Model": model,
    "Color": color,
    "Storage": storage,
    "itemcount": itemCount,
    "perpiece": price,
    "Condtion": condition,
  });
}

// Future<void> addsale({
//   required String salemodel,
//   required File saleimage,
//   required String salebrand,
//   required String salecolor,
//   required String salestroage,
//   required String salecondtion,
//   required String saleempoyle,
//   required String saleitemcount,
//   required String saleprice,
//   required String salepurscheamout,
//   required String phonenumber,
//   required String inovice,
//   required Function(Map<String, dynamic>) onaddsale,
// }) async {
//   final box = Hive.box<List<Saleitems>>("saleadd_box");
//   final addsale = Saleitems(
//       invoiceno: inovice,
//       phonenumber: phonenumber,
//       saleHivebrand: salebrand,
//       saleHivemodel: salemodel,
//       saleHiveColor: salecolor,
//       saleHiveStroage: salestroage,
//       saleHiveCondtion: salecondtion,
//       saleHiveitemcount: saleitemcount,
//       saleHiveprice: saleprice,
//       empolye: saleempoyle,
//       saleimgpath: saleimage.path,
//       salepurshaceamount: salepurscheamout,
//       saledate: DateTime.now().toString());
//   List<Saleitems> items = box.get('items', defaultValue: []) ?? [];
//   // Saleitems.addAll(items);
//   onaddsale({
//     "Salebrand": salebrand,
//     "Salemodel": salemodel,
//     "Salecolor": salecolor,
//     "SaleStroage": salestroage,
//     "Salecondtion": salecondtion,
//     "Saleempolye": saleempoyle,
//     "Saleitemcount": saleitemcount,
//     "Saleprice": saleprice,
//     "Saleimgpath": saleimage,
//     "Salepurschaeamount": salepurscheamout
//   });
// }

Future<void> AddAccount(
    {required Uint8List image,
    required String email,
    required String USer,
    required String phonenumber,
    required String password,
    required Function(Map<String, dynamic>) onAddAccount,
    required String city}) async {
  final box = Hive.box<CreateAccount>("Create_Account");
  final addaccount = CreateAccount(
      Email: email,
      USername: USer,
      password: password,
      phonenumber: phonenumber,
      createimg: image,
      city: city);
  box.add(addaccount);
  onAddAccount({
    "Accimage": image,
    "email": email,
    "user": USer,
    "phonenumbr": phonenumber,
    "password": password
  });
}

Future<void> CreatePinn({
  required String enterpin,
  required Function(Map<String, dynamic>) Createpintest,
}) async {
  final box = Hive.box<CreatePin>("Create_pin");
  final Creat4digitpin = CreatePin(enterpin: enterpin);
  box.add(Creat4digitpin);
  Createpintest({"Createpin": enterpin});
}
