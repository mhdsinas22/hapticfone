// import 'dart:io';
// import 'package:flutter/material.dart';
// import 'package:hapticfone_stock/CARDSTOCKHOME/cardstock.dart';
// import 'package:hapticfone_stock/Stockmange/Database/db_stockitems.dart';
// import 'package:hapticfone_stock/Stockmange/notselectphonebrad.dart';
// import 'package:hapticfone_stock/Stockmange/phonebrand.dart';
// import 'package:hapticfone_stock/Stockmange/return_page.dart';
// import 'package:hapticfone_stock/alertitems/alert_delet.dart';
// import 'package:hapticfone_stock/alertitems/alert_edit.dart';
// import 'package:hapticfone_stock/searchbr.dart';
// import 'package:hive/hive.dart';

// class StockMangeHome extends StatefulWidget {
//   final List<Map<dynamic, dynamic>> stockdata;
//   const StockMangeHome({
//     super.key,
//     required this.stockdata,
//   });

//   @override
//   State<StockMangeHome> createState() => _StockMangeHomeState();
// }

// class _StockMangeHomeState extends State<StockMangeHome> {
//   List<StockItems> fetchitems = []; //fetch chetyhe data ithilleann store cheyya
//   List<StockItems> filetdfetchiems = [];

//   void fetchstockitems() {
//     final box = Hive.box<StockItems>("stockitem_box");
//     setState(() {
//       fetchitems = box.values.toList();
//       filetdfetchiems = fetchitems;
//     });
//   }

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

//   Future<void> deletstock(int key) async {
//     final box = Hive.box<StockItems>("stockitem_box");
//     await box.delete(key);
//     fetchstockitems();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           children: [
//             const SizedBox(
//               height: 20,
//             ),
//             Stack(
//               children: [
//                 Row(
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.all(8.0),
//                       child: CircleAvatar(
//                         backgroundImage: AssetImage("assest/1.jpg"),
//                         radius: 30,
//                       ),
//                     ),
//                     Column(
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
//                         )
//                       ],
//                     ),
//                   ],
//                 ),
//                 Positioned(
//                     right: 10,
//                     top: 15,
//                     child: GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => const ReturnPage()));
//                       },
//                       child: Container(
//                         decoration: BoxDecoration(
//                             color: Colors.black,
//                             borderRadius: BorderRadius.circular(15)),
//                         child: IconButton(
//                           onPressed: () {
//                             Navigator.of(context).push(MaterialPageRoute(
//                                 builder: (context) => const ReturnPage()));
//                           },
//                           icon: Icon(Icons.cached),
//                           color: Colors.white,
//                         ),
//                       ),
//                     ))
//               ],
//             ),
//             SearchTesting(controller: serachcontroller),
//             const Padding(
//               padding: EdgeInsets.all(10.0),
//               child: Row(
//                 children: [
//                   Text(
//                     "Categories",
//                     style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
//                   ),
//                 ],
//               ),
//             ),
//             Row(
//               children: [
//                 Container(
//                   width: 10,
//                 ),
//                 stbrand(brand: "ALL"),
//                 const SizedBox(
//                   width: 8,
//                 ),
//                 Notbrand(
//                   brand: "APPLE",
//                   width: 80,
//                   height: 20,
//                   fontsize: 10,
//                 ),
//                 const SizedBox(
//                   width: 8,
//                 ),
//                 Notbrand(
//                   width: 90,
//                   height: 20,
//                   fontsize: 8,
//                   brand: "SAMSUNG",
//                 ),
//                 const SizedBox(
//                   width: 2,
//                 ),
//                 Notbrand(
//                   brand: "OTHER",
//                   width: 80,
//                   height: 20,
//                   fontsize: 9,
//                 ),
//               ],
//             ),
//             Expanded(
//               child: ListView.builder(
//                   itemCount: filetdfetchiems.length,
//                   itemBuilder: (context, index) {
//                     StockItems stock = filetdfetchiems[index];
//                     return CardStockHome(
//                       stock: stock,
//                       ondlt: () =>
//                           dltalert(context, index, fetchitems, deletstock),
//                       onedit: () {
//                         editalert(context, index, setState, fetchitems);
//                       },
//                     );
//                     // return Padding(
//                     //   padding: const EdgeInsets.all(8),
//                     //   child: Stack(
//                     //     children: [
//                     //       Card(
//                     //         elevation: 5,
//                     //         color: Colors.white,
//                     //         child: Row(
//                     //           children: [
//                     //             Padding(
//                     //               padding: const EdgeInsets.all(8.0),
//                     //               child: stock.hiveimg != null
//                     //                   ? Image.file(
//                     //                       File(
//                     //                         stock.hiveimg,
//                     //                       ),
//                     //                       width: 100,
//                     //                       height: 100)
//                     //                   : const Icon(Icons.image_not_supported),
//                     //             ),
//                     //             Column(
//                     //               crossAxisAlignment: CrossAxisAlignment.start,
//                     //               children: [
//                     //                 Text(
//                     //                   stock.hivemodel,
//                     //                   style: const TextStyle(
//                     //                       fontSize: 20,
//                     //                       fontWeight: FontWeight.bold),
//                     //                 ),
//                     //                 Text(
//                     //                   "Storage:${stock.hivestorage}",
//                     //                   style: const TextStyle(
//                     //                       fontWeight: FontWeight.bold,
//                     //                       fontSize: 12),
//                     //                 ),
//                     //                 Text(
//                     //                   "Condtion:-${stock.hivecondtion}",
//                     //                   style: const TextStyle(
//                     //                       fontSize: 12,
//                     //                       fontWeight: FontWeight.bold),
//                     //                 ),
//                     //                 Text(
//                     //                   "Color:${stock.hivecolor}",
//                     //                   style: const TextStyle(
//                     //                       fontWeight: FontWeight.bold,
//                     //                       fontSize: 12),
//                     //                 ),
//                     //                 Text(
//                     //                   "PRICE:-₹${stock.hiveprice}",
//                     //                   style: const TextStyle(
//                     //                       fontWeight: FontWeight.bold,
//                     //                       fontSize: 12),
//                     //                 ),
//                     //               ],
//                     //             ),
//                     //           ],
//                     //         ),
//                     //       ),
//                     //       Positioned(
//                     //         top: 10,
//                     //         right: 10,
//                     //         child: Row(
//                     //           children: [
//                     //             IconButton(
//                     //                 onPressed: () {
//                     //                   dltalert(context, index, fetchitems,
//                     //                       deletstock);
//                     //                 },
//                     //                 icon: const Icon(
//                     //                   Icons.delete,
//                     //                   color: Colors.red,
//                     //                   size: 20,
//                     //                 )),
//                     //             IconButton(
//                     //                 onPressed: () {
//                     //                   editalert(
//                     //                       context, index, setState, fetchitems);
//                     //                 },
//                     //                 icon: const Icon(
//                     //                   Icons.edit,
//                     //                   size: 20,
//                     //                 )),
//                     //           ],
//                     //         ),
//                     //       ),
//                     //       Positioned(
//                     //           bottom: 10,
//                     //           right: 10,
//                     //           child: Text(
//                     //             "ITEM COUNT:${stock.hiveitemcount}",
//                     //             style: const TextStyle(
//                     //                 fontWeight: FontWeight.bold, fontSize: 12),
//                     //           ))
//                     //     ],
//                     //   ),
//                     // );
//                   }),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }



 // stbrand(brand: "ALL"),
                  // SizedBox(width: screenWidth * 0.02),
                  // Notbrand(
                  //   brand: "APPLE",
                  //   width: screenWidth * 0.2,
                  //   height: screenHeight * 0.04,
                  //   fontsize: screenWidth * 0.03,
                  // ),
                  // SizedBox(width: screenWidth * 0.02),
                  // Notbrand(
                  //   brand: "SAMSUNG",
                  //   width: screenWidth * 0.25,
                  //   height: screenHeight * 0.04,
                  //   fontsize: screenWidth * 0.03,
                  // ),
                  // SizedBox(width: screenWidth * 0.02),
                  // Notbrand(
                  //   brand: "OTHER",
                  //   width: screenWidth * 0.2,
                  //   height: screenHeight * 0.04,
                  //   fontsize: screenWidth * 0.03,
                  // ),

                  /// saleadd time stock reduce 
                  ///        // onPressed: () async {
                    //   // Open the Hive box for StockItems
                    //   final stockBox =
                    //       await Hive.openBox<StockItems>('stockitem_box');

                    //   try {
                    //     // Locate the stock item matching the sale details
                    //     final stockItem = stockBox.values.firstWhere(
                    //       (item) =>
                    //           item.hivebrand == brandcontroller.text &&
                    //           item.hivemodel == covertmodelcontroller.text,
                    //       orElse: () => StockItems(
                    //           hiveimg: "",
                    //           hivebrand: "",
                    //           hivemodel: "",
                    //           hivecolor: "",
                    //           hivestorage: "",
                    //           hivecondtion: "",
                    //           hiveitemcount: "0",
                    //           hiveprice:
                    //               ""), // Null handle cheyyan orElse provide cheythu
                    //     );

                    //     // Parse the current stock count
                    //     int currentStock =
                    //         int.tryParse(stockItem.hiveitemcount) ?? 0;
                    //     int saleCount = int.tryParse(covertitemcount.text) ?? 0;

                    //     if (saleCount <= currentStock) {
                    //       // Update the stock count
                    //       int updatedStock = currentStock - saleCount;

                    //       // Save the updated item back to Hive
                    //       stockBox.put(
                    //         stockItem.key,
                    //         StockItems(
                    //           hiveimg: stockItem.hiveimg,
                    //           hivebrand: stockItem.hivebrand,
                    //           hivemodel: stockItem.hivemodel,
                    //           hivecolor: stockItem.hivecolor,
                    //           hivestorage: stockItem.hivestorage,
                    //           hivecondtion: stockItem.hivecondtion,
                    //           hiveitemcount: updatedStock.toString(),
                    //           hiveprice: stockItem.hiveprice,
                    //         ),
                    //       );

                    //       // Add the sale to the sales box
                    //       widget.onaddsale({
                    //         "brand": brandcontroller.text,
                    //         "Modee": covertmodelcontroller.text,
                    //         "Color": covertsalecolrcontroller.text,
                    //         "Stroage": covertsaleStroagecontroller.text,
                    //         "Condtion": covertsalecondtioncontroller.text,
                    //         "Empolye": covertemplyename.text,
                    //         "itemcount": covertitemcount.text,
                    //         "Price": convertsaleprcice.text,
                    //         "Image": widget.convertsaleimg,
                    //       });

                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(
                    //             content: Text(
                    //                 "Sale added and stock updated successfully!")),
                    //       );
                    //       Navigator.of(context).pushReplacement(
                    //           MaterialPageRoute(
                    //               builder: (context) =>
                    //                   Bottomuser(selecteddindex: 1)));
                    //     } else {
                    //       ScaffoldMessenger.of(context).showSnackBar(
                    //         SnackBar(content: Text("Insufficient stock!")),
                    //       );
                    //     }
                    //   } catch (e) {
                    //     ScaffoldMessenger.of(context).showSnackBar(
                    //       SnackBar(content: Text("Error: ${e.toString()}")),
                    //     );
                    //   }
                    // },