import 'dart:core';
import 'package:flutter/material.dart';
import 'package:haptic_fone/cardstockhome/cardstock.dart';
import 'package:haptic_fone/cardstockhome/choicechips.dart';
import 'package:haptic_fone/alertitems/alert_delet.dart';
import 'package:haptic_fone/alertitems/alert_edit.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/textFormfileds/searchbr.dart';
import 'package:hive/hive.dart';

class StockMangeHome extends StatefulWidget {
  final List<Map<dynamic, dynamic>> stockdata;
  const StockMangeHome({
    super.key,
    required this.stockdata,
  });

  @override
  State<StockMangeHome> createState() => _StockMangeHomeState();
}

class _StockMangeHomeState extends State<StockMangeHome> {
  List<StockItems> fetchitems = [];
  List<StockItems> filetdfetchiems = [];
  TextEditingController serachcontroller = TextEditingController();
  List<String> optionscatergu = [
    "APPLE",
    "SAMSUNG",
    "GOOGLE",
    "ONEPLUS",
    "LENNOVO",
    "MOTOROLLA"
  ];
  String serach = '';
  String selected = "";
  @override
  void initState() {
    super.initState();
    fetchstockitems();
    serachcontroller.addListener(() {
      setState(() {
        serach = serachcontroller.text;
        filetdfetchiems = fetchitems.where((item) {
          return item.hivemodel.toLowerCase().contains(serach);
        }).toList();
      });
    });
  }

  void fetchstockitems() {
    final box = Hive.box<StockItems>("stockitem_box");
    setState(() {
      fetchitems = box.values.toList();
      filetdfetchiems = fetchitems;
    });
  }

  Future<void> deletstock(int key) async {
    final box = Hive.box<StockItems>("stockitem_box");
    await box.delete(key);
    fetchstockitems();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            SizedBox(height: screenHeight * 0.02),
            // Header Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    CircleAvatar(
                      backgroundImage: const AssetImage("assest/1.jpg"),
                      radius: screenWidth * 0.08,
                    ),
                    SizedBox(width: screenWidth * 0.02),
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Welcome",
                          style: TextStyle(color: Color(0xFFD9D9D9)),
                        ),
                        Text(
                          "Haptic",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: screenHeight * 0.02),
            // Search Bar
            SearchTesting(controller: serachcontroller),

            SizedBox(height: screenHeight * 0.02),
            // Categories Section
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Categories",
                style: TextStyle(
                  fontSize: screenWidth * 0.05,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            // Category Buttons
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Chips(
                    options:
                        optionscatergu, // Corrected typo: optionscatergu -> optionsCategory
                    seleted: selected, // Selected category
                    onselectedcat: (String selectedCategoryValue) {
                      // Corrected name
                      setState(() {
                        selected =
                            selectedCategoryValue; // Update the selected category
                        filetdfetchiems = selectedCategoryValue.isEmpty
                            ? fetchitems // If no category is selected, show all items
                            : fetchitems.where((item) {
                                return item.hivebrand.toLowerCase() ==
                                    selectedCategoryValue
                                        .toLowerCase(); // Filter items based on selected category
                              }).toList();
                      });
                    },
                  )
                ],
              ),
            ),
            SizedBox(height: screenHeight * 0.02),
            // List of Items
            Expanded(
              child: ListView.builder(
                itemCount: filetdfetchiems.length,
                itemBuilder: (context, index) {
                  StockItems stock = filetdfetchiems[index];
                  // final key = fetchitems[index].key;
                  return Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: screenHeight * 0.01),
                      child: CardStockHome(
                        stock: stock,
                        ondlt: () {
                          dltalert(context, index, fetchitems, deletstock);
                        },
                        onedit: () {
                          editalert(context, index, setState, fetchitems);
                        },
                      ));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
