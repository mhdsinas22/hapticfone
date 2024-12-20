import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:haptic_fone/cardstockhome/inovicecard.dart';
import 'package:haptic_fone/dashboard/dashbord_utils.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:intl/intl.dart';

class InvoiceSaleDetails extends StatefulWidget {
  final Uint8List imgpath;
  final String emplylename;
  final String phonenumber;
  final String saledate;
  final String saleitem;
  final String itemcount;
  final String totalAmount;
  final String stroage;
  final String condtion;
  final String color;
  final String invoiceno;
  const InvoiceSaleDetails(
      {super.key,
      required this.condtion,
      required this.stroage,
      required this.imgpath,
      required this.emplylename,
      required this.phonenumber,
      required this.saledate,
      required this.saleitem,
      required this.itemcount,
      required this.totalAmount,
      required this.color,
      required this.invoiceno});

  @override
  State<InvoiceSaleDetails> createState() => _InvoiceSaleDetailsState();
}

class _InvoiceSaleDetailsState extends State<InvoiceSaleDetails> {
  double totalSalePrice = 0.0;
  double totalPurchaseAmount = 0.0;
  double totalProfit = 0.0;
  List<Saleitems> filteredSales = [];
  List<Saleitems> allSales = [];
  Future<void> loadsalesdata() async {
    allSales = await fetehsalesData();
    setState(() {
      filteredSales = allSales;
      totalSalePrice = calculateTotalSalePrice(allSales);
      totalPurchaseAmount = calculateTotalPurchaseAmount(allSales);
    });
  }

  @override
  void initState() {
    super.initState();
    loadsalesdata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 5,
          color: const Color.fromARGB(255, 252, 252, 252),
          child: Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  "Total Amount:-",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(15)),
                  height: 300,
                  width: 300,
                  child: Center(
                      child: Text(
                    widget.totalAmount,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 18),
                  )),
                ),
              )
            ],
          ),
        ),
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: const Text("Invoice Detalis"),
          foregroundColor: const Color(0xFF75B809),
        ),
        body: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    elevation: 5,
                    color: const Color.fromARGB(255, 184, 207, 158),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            children: [
                              const Text(
                                "Who sold this",
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                              Text(widget.emplylename),
                              Text("+91${widget.phonenumber}"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                    right: 35,
                    bottom: 55,
                    child: RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                          text: "InVoice#             ",
                          style: TextStyle(color: Colors.black)),
                      TextSpan(
                          text: widget.invoiceno,
                          style: const TextStyle(color: Colors.black))
                    ]))),
                const SizedBox(
                  width: 10,
                ),
                Positioned(
                    right: 35,
                    bottom: 35,
                    child: RichText(
                        text: TextSpan(children: [
                      const TextSpan(
                          text: "Date ",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          )),
                      TextSpan(
                          text: DateFormat("yyyy-MM-dd")
                              .format(DateTime.parse(widget.saledate)),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Colors.black,
                          ))
                    ])))
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SaleItemCard(
                imgpath: widget.imgpath,
                saleItem: widget.saleitem,
                storage: widget.stroage,
                condition: widget.condtion,
                color: widget.color,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Table(
                border: TableBorder.all(),
                children: [
                  const TableRow(children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "ITEM",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Quantity",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text(
                        "Amonut",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    )
                  ]),
                  TableRow(children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.saleitem),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.itemcount),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(widget.totalAmount),
                    ),
                  ]),
                ],
              ),
            ),
          ],
        ));
  }
}
