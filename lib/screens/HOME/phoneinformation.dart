import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/screens/HOME/CovertSale.dart';
import 'package:hive/hive.dart';

class Phoneinformation extends StatefulWidget {
  final String pusrhamnout;
  final String brand;
  final Uint8List imgpath;
  final String reamingstock;
  // ignore: non_constant_identifier_names
  final String Model;
  // ignore: non_constant_identifier_names
  final String Color;
  // ignore: non_constant_identifier_names
  final String Storage;
  final String condtion;
  final String price;
  const Phoneinformation(
      {super.key,
      required this.brand,
      required this.imgpath,
      required this.reamingstock,
      // ignore: non_constant_identifier_names
      required this.Model,
      // ignore: non_constant_identifier_names
      required this.Color,
      // ignore: non_constant_identifier_names
      required this.Storage,
      required this.condtion,
      required this.price,
      required this.pusrhamnout});

  @override
  State<Phoneinformation> createState() => _PhoneinformationState();
}

class _PhoneinformationState extends State<Phoneinformation> {
  List<StockItems> fetchHomeitems = [];
  List<StockItems> filetdfetchHomeiems = [];
  void fetchhomedata() {
    final box = Hive.box<StockItems>("stockitem_box");
    setState(() {
      fetchHomeitems = box.values.toList();
      filetdfetchHomeiems = fetchHomeitems;
    });
  }

  int selectindex = 0;

  void fu(int index) {
    setState(() {
      selectindex = index;
    });
  }

  TextEditingController serachcontroller = TextEditingController();
  String serach = '';
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchhomedata();
    serachcontroller.addListener(() {
      setState(() {
        serach = serachcontroller.text;
        filetdfetchHomeiems = fetchHomeitems.where((item) {
          return item.hivemodel.toLowerCase().contains(serach);
        }).toList();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize:
            const Size.fromHeight(50.0), // Set the height of the app bar
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF345005), Color(0xFF75B809)], // Gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            foregroundColor: Colors.white,
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  decoration: BoxDecoration(
                      color: const Color(0xFF75B809),
                      borderRadius: BorderRadius.circular(8.0)),
                  child: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: const Icon(Icons.chevron_left),
                    iconSize: 20,
                  )),
            ),
            backgroundColor:
                Colors.transparent, // Make the background transparent
            elevation: 0, // Remove the default shadow
          ),
        ),
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    decoration: const BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xFF345005), Color(0xFF75B809)]),
                        color: Color(0xFF75B809),
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(30.0),
                            bottomRight: Radius.circular(30.0))),
                    width: 500,
                    height: 450,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(width: 0),
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Expanded(
                                  child: Image.memory(
                                widget.imgpath,
                                width: 150,
                                height: 150,
                              )),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                widget.Model,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40),
                              ),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(
                                "ReamingStock:${widget.reamingstock}",
                                style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              ),
                              Container(
                                height: 20,
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                const SizedBox(
                  width: 20,
                ),
                const Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Description",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: const Color(0xFF75B809),
                        borderRadius: BorderRadius.circular(20)),
                    width: 300,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Color:- ${widget.Color}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Storage:-${widget.Storage}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Condtion:-${widget.condtion}",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Price:- ${widget.price}₹",
                            style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 25),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => Covertsale(
                              convertpusrcheamontu: widget.pusrhamnout,
                              convertprice: widget.price,
                              convertsaleimg: widget.imgpath,
                              convertsalebrand: widget.brand,
                              covertmodel: widget.Model,
                              covnvertSalecolor: widget.Color,
                              convertsaleStroage: widget.Storage,
                              convertsalecondtion: widget.condtion,
                              onaddsale: (data) {
                                print("HEllo${data}");
                                // final box = Hive.box<Saleitems>("saleadd_box");
                                // box.add(Saleitems.fromMap(data));
                              },
                            )));
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF75B809),
                      foregroundColor: Colors.white),
                  child: const Text("ADD TO SALE"),
                )
              ],
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: "HOME",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart), label: "DASHBORAD"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_sharp), label: "PROFILE")
          ]),
    );
  }
}
