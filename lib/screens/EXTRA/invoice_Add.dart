// ignore: duplicate_ignore
// ignore: file_names
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:haptic_fone/cardstockhome/addsalesectioncard.dart';
import 'package:haptic_fone/Calacutions/calacution_functyions.dart';
import 'package:haptic_fone/dashboard/Dashbord.dart';
import 'package:haptic_fone/dashboard/dashbord_utils.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/textFormfileds/textformfikedconvertsalemdoel.dart';
import 'package:haptic_fone/dummy/dummy.dart';
import 'package:haptic_fone/functions/sale_revence_functions.dart';
import 'package:haptic_fone/screens/EXTRA/Bottombutton.dart';
import 'package:haptic_fone/screens/HOME/haptic.home.dart';

import 'package:intl/intl.dart';

class MulipliteSale extends StatefulWidget {
  final String totalamount;

  final Function(Map<String, dynamic>) onaddsale;
  const MulipliteSale({
    super.key,
    required this.onaddsale,
    required this.totalamount,
  });

  @override
  State<MulipliteSale> createState() => _MulipliteSaleState();
}

class _MulipliteSaleState extends State<MulipliteSale> {
  int invoicenumber = 1;
  final _formKey = GlobalKey<FormState>();
  List<Map<String, dynamic>> saleItems = [];
  TextEditingController phonenumber = TextEditingController();
  TextEditingController emplyename = TextEditingController();
  TextEditingController totalamount = TextEditingController();
  List<Map<String, dynamic>> saleitu = Dummy.addmuiltsale;
  void deletstock(Map<String, dynamic> item) {
    setState(() {
      saleitu.remove(item); // Remove the item from the list
      updateTotalAmount();
    });
  }

  List<Saleitems> allSales = [];
  Future<void> loadsalesdata() async {
    final salesData = await fetehsalesData();
    print(
        "Fetched Sales Data: $salesData"); // Ensure invoiceno is a valid String
    setState(() {
      allSales = salesData;
      invoicenumber =
          allSales.isNotEmpty ? int.parse(allSales.last.invoiceno) + 1 : 1;
    });
  }

  void updateinovicenumber() {
    setState(() {
      invoicenumber += 1;
    });
  }

  @override
  void initState() {
    super.initState();
    // Initializing the sale item list with the item passed from Covertsale
    loadsalesdata();
    totalamount.text = calculateTotalAmount().toStringAsFixed(2);
  }

  double calculateTotalAmount() {
    return saleitu.fold(0.0, (sum, item) {
      final price = double.tryParse(item['Price']?.toString() ?? '0') ?? 0.0;
      final count =
          double.tryParse(item['itemcount']?.toString() ?? '0') ?? 0.0;
      return sum + (price * count);
    });
  }

  void updateTotalAmount() {
    setState(() {
      totalamount.text = calculateTotalAmount().toStringAsFixed(2);
    });
  }

  DateTime? date = DateTime.now();

  Future<void> SelectFromdate(BuildContext context) async {
    final DateTime? selectdate = await selectfromdate(context, date);
    if (selectdate != null) {
      date = fromdate;
    }
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    saleitu.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            foregroundColor: const Color(0xFF75B809),
            backgroundColor: Colors.white,
            centerTitle: true,
            title: const Text(
              "ADD SALE",
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Text("In Voice No"),
                          Text(invoicenumber.toString())
                        ],
                      ),
                    ),
                    const Text("|"),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: InkWell(
                        onTap: () {
                          SelectFromdate(context);
                        },
                        child: Column(
                          children: [
                            const Text("Date"),
                            Text(DateFormat("yyyy-MM-dd ").format(date!))
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormfiledconvert(
                    hint: "Emplye name",
                    controller2: emplyename,
                    keybordtype: TextInputType.text,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormfiledconvert(
                      keybordtype: const TextInputType.numberWithOptions(),
                      hint: "PhoneNumber",
                      controller2: phonenumber),
                ),
                const SizedBox(
                  height: 10,
                ),
                ...saleitu.map((items) {
                  return AddSaleitems(
                      ondltsale: () => deletstock(items),
                      oneditsale: () {},
                      items: items);
                }),
                InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) => Home()))
                        .then((selectedItem) {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: const Color(0xFF75B809)),
                        borderRadius: BorderRadius.circular(10)),
                    width: 300,
                    height: 50,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.add_rounded,
                          color: Color(0xFF75B809),
                        ),
                        Text(
                          "Add Item",
                          style: TextStyle(
                              color: Color(0xFF75B809),
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    children: [
                      const Text(
                        "TOTAL AMOUNT",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: TextFormField(
                            readOnly: true,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                            controller: totalamount,
                            decoration: InputDecoration(
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: BottomButtons(onFirstButtonPressed: () {
            Navigator.of(context).pop();
            Dummy.addmuiltsale.clear();
          }, onSecondButtonPressed: () async {
            if (_formKey.currentState!.validate()) {}
            await SetReady.handleSale(
                invoicenumber: invoicenumber,
                phonenumber: phonenumber,
                onAddSale: widget.onaddsale,
                saleitu: saleitu,
                emplyename: emplyename,
                context: context);
          })),
    );
  }
}
