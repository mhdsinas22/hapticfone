// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:hapticfone_stock/Database/db_stockitems.dart';
// import 'package:hapticfone_stock/Stockmange/notselectphonebrad.dart';
// import 'package:hapticfone_stock/Stockmange/phonebrand.dart';
// import 'package:hapticfone_stock/Stockmange/return_page.dart';
// import 'package:hapticfone_stock/alertitems/alert_delet.dart';
// import 'package:hapticfone_stock/alertitems/alert_edit.dart';
// import 'package:hive/hive.dart';

// class StockMangeHome extends StatefulWidget {
//   final List<Map<dynamic, dynamic>> stockdata;
//   StockMangeHome({
//     super.key,
//     required this.stockdata,
//   });

//   @override
//   State<StockMangeHome> createState() => _StockMangeHomeState();
// }

// class _StockMangeHomeState extends State<StockMangeHome> {
//   List<StockItems> fetchitems = [];
//   List<StockItems> filetdfetchiems = [];
//   TextEditingController serachcontroller = TextEditingController();
//   String serach = '';

//   @override
//   void initState() {
//     super.initState();
//     fetchstockitems();
//     serachcontroller.addListener(() {
//       setState(() {
//         serach = serachcontroller.text;
//         filetdfetchiems = fetchitems.where((item) {
//           return item.hivemodel.toLowerCase().contains(serach);
//         }).toList();
//       });
//     });
//   }

//   void fetchstockitems() {
//     final box = Hive.box<StockItems>("stockitem_box");
//     setState(() {
//       fetchitems = box.values.toList();
//       filetdfetchiems = fetchitems;
//     });
//   }

//   Future<void> deletstock(int key) async {
//     final box = Hive.box<StockItems>("stockitem_box");
//     await box.delete(key);
//     fetchstockitems();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             SizedBox(height: screenHeight * 0.02),
//             // Header Section
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   children: [
//                     CircleAvatar(
//                       backgroundImage: AssetImage("assest/1.jpg"),
//                       radius: screenWidth * 0.08,
//                     ),
//                     SizedBox(width: screenWidth * 0.02),
//                     Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           "Welcome",
//                           style: TextStyle(color: Color(0xFFD9D9D9)),
//                         ),
//                         Text(
//                           "Haptic",
//                           style: TextStyle(
//                             color: Colors.black,
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//                 IconButton(
//                   onPressed: () {
//                     Navigator.of(context).push(
//                         MaterialPageRoute(builder: (context) => ReturnPage()));
//                   },
//                   icon: Icon(Icons.cached, color: Colors.black),
//                 ),
//               ],
//             ),
//             SizedBox(height: screenHeight * 0.02),
//             // Search Bar
//             TextField(
//               controller: serachcontroller,
//               decoration: InputDecoration(
//                 enabledBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(25),
//                   borderSide: BorderSide(width: 1),
//                 ),
//                 prefixIcon: Icon(Icons.search, size: screenWidth * 0.05),
//                 focusedBorder: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(15),
//                 ),
//                 labelText: "What you Want",
//                 labelStyle: TextStyle(fontSize: screenWidth * 0.04),
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.02),
//             // Categories Section
//             Align(
//               alignment: Alignment.centerLeft,
//               child: Text(
//                 "Categories",
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.05,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.02),
//             // Category Buttons
//             SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               child: Row(
//                 children: [
//                   stbrand(brand: "ALL"),
//                   SizedBox(width: screenWidth * 0.02),
//                   Notbrand(
//                     brand: "APPLE",
//                     width: screenWidth * 0.2,
//                     height: screenHeight * 0.04,
//                     fontsize: screenWidth * 0.03,
//                   ),
//                   SizedBox(width: screenWidth * 0.02),
//                   Notbrand(
//                     brand: "SAMSUNG",
//                     width: screenWidth * 0.25,
//                     height: screenHeight * 0.04,
//                     fontsize: screenWidth * 0.03,
//                   ),
//                   SizedBox(width: screenWidth * 0.02),
//                   Notbrand(
//                     brand: "OTHER",
//                     width: screenWidth * 0.2,
//                     height: screenHeight * 0.04,
//                     fontsize: screenWidth * 0.03,
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.02),
//             // List of Items
//             Expanded(
//               child: ListView.builder(
//                 itemCount: filetdfetchiems.length,
//                 itemBuilder: (context, index) {
//                   StockItems stock = filetdfetchiems[index];
//                   return Padding(
//                     padding:
//                         EdgeInsets.symmetric(vertical: screenHeight * 0.01),
//                     child: Stack(
//                       children: [
//                         Card(
//                           color: Colors.white,
//                           elevation: 5,
//                           child: Padding(
//                             padding: EdgeInsets.all(screenWidth * 0.03),
//                             child: Row(
//                               children: [
//                                 stock.hiveimg != null
//                                     ? Image.file(
//                                         File(stock.hiveimg),
//                                         width: screenWidth * 0.2,
//                                         height: screenHeight * 0.1,
//                                         fit: BoxFit.cover,
//                                       )
//                                     : Icon(Icons.image_not_supported,
//                                         size: screenWidth * 0.2),
//                                 SizedBox(width: screenWidth * 0.03),
//                                 Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       stock.hivemodel,
//                                       style: TextStyle(
//                                         fontSize: screenWidth * 0.05,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text("Storage: ${stock.hivestorage}"),
//                                     Text("Condition: ${stock.hivecondtion}"),
//                                     Text("Color: ${stock.hivecolor}"),
//                                     Text("Price: ₹${stock.hiveprice}"),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                         Positioned(
//                           top: 10,
//                           right: 10,
//                           child: Row(
//                             children: [
//                               IconButton(
//                                   onPressed: () {
//                                     dltalert(
//                                         context, index, fetchitems, deletstock);
//                                   },
//                                   icon: Icon(
//                                     Icons.delete,
//                                     color: Colors.red,
//                                     size: 20,
//                                   )),
//                               IconButton(
//                                   onPressed: () {
//                                     editalert(
//                                         context, index, setState, fetchitems);
//                                   },
//                                   icon: Icon(
//                                     Icons.edit,
//                                     size: 20,
//                                   )),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
