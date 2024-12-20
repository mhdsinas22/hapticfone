// // import 'dart:io';
// // import 'package:flutter/material.dart';
// // import 'package:hapticfone_stock/Stockmange/StockmangeBottomnav.dart';
// // import 'package:hapticfone_stock/Stockmange/textformfiledforAdd.dart';
// // import 'package:hapticfone_stock/test/2.dart';
// // import 'package:image_picker/image_picker.dart';

// // class Stockadd extends StatefulWidget {
// //   const Stockadd({super.key});

// //   @override
// //   State<Stockadd> createState() => _StockaddState();
// // }

// // class _StockaddState extends State<Stockadd> {
// //   File? _image;
// //   TextEditingController brandController = TextEditingController();
// //   TextEditingController modelController = TextEditingController();
// //   TextEditingController colorController = TextEditingController();
// //   TextEditingController storageController = TextEditingController();
// //   TextEditingController conditionController = TextEditingController();
// //   TextEditingController itemCountController = TextEditingController();
// //   TextEditingController priceController = TextEditingController();

// //   // Image picker method
// //   Future<void> pickImage() async {
// //     final picker = ImagePicker();
// //     final pickedFile =
// //         await picker.pickImage(source: ImageSource.gallery); // Correct method
// //     setState(() {
// //       if (pickedFile != null) {
// //         _image = File(pickedFile.path); // Saving the image to File
// //       } else {
// //         print("No photo selected");
// //       }
// //     });
// //   }

// //   List<Map<String, dynamic>> stockData = [];

// //   // Method to add stock
// //   void addStock() {
// //     setState(() {
// //       stockData.add({
// //         'image': _image,
// //         'brand': brandController.text,
// //         'model': modelController.text,
// //         'color': colorController.text,
// //         'storage': storageController.text,
// //         'condition': conditionController.text,
// //         'itemCount': itemCountController.text,
// //         'price': priceController.text,
// //       });
// //     });

// //     // Navigate to another page if needed
// //     Navigator.push(
// //       context,
// //       MaterialPageRoute(
// //         builder: (context) => MangeHome(stockData: stockData),
// //       ),
// //     );
// //   }

// //   @override
// //   void dispose() {
// //     brandController.dispose();
// //     modelController.dispose();
// //     colorController.dispose();
// //     storageController.dispose();
// //     conditionController.dispose();
// //     itemCountController.dispose();
// //     priceController.dispose();
// //     super.dispose();
// //   }

// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: Colors.white,
// //       body: Padding(
// //         padding: const EdgeInsets.all(15.0),
// //         child: ListView(
// //           children: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 IconButton(
// //                   onPressed: () {
// //                     Navigator.of(context).pushReplacement(MaterialPageRoute(
// //                       builder: (context) => StockBottom(),
// //                     ));
// //                   },
// //                   icon: Icon(
// //                     Icons.chevron_left,
// //                     size: 40,
// //                   ),
// //                 ),
// //                 Text(
// //                   "ADD STOCK",
// //                   style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
// //                 ),
// //                 Container(
// //                   width: 50,
// //                 )
// //               ],
// //             ),
// //             Column(
// //               children: [
// //                 InkWell(
// //                   onTap: () {
// //                     pickImage(); // Correct method call
// //                   },
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                         color: Colors.white, border: Border.all()),
// //                     width: 250,
// //                     height: 160,
// //                     child: Column(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         _image != null
// //                             ? Expanded(
// //                                 child: Image.file(
// //                                   _image!,
// //                                   width: 250,
// //                                   height: 140,
// //                                 ),
// //                               )
// //                             : Column(
// //                                 children: [
// //                                   IconButton(
// //                                     onPressed: () {
// //                                       pickImage(); // Correct method call
// //                                     },
// //                                     icon: Icon(
// //                                       Icons.insert_photo,
// //                                       size: 50,
// //                                     ),
// //                                   ),
// //                                   Text(
// //                                     "Add image",
// //                                     style:
// //                                         TextStyle(fontWeight: FontWeight.bold),
// //                                   )
// //                                 ],
// //                               ),
// //                       ],
// //                     ),
// //                   ),
// //                 ),
// //                 SizedBox(height: 10),
// //                 Textformfiledforadd(
// //                   hint: "Enter the brand name",
// //                   controller: brandController,
// //                 ),
// //                 SizedBox(height: 10),
// //                 Textformfiledforadd(
// //                   hint: "Enter the model name",
// //                   controller: modelController,
// //                 ),
// //                 Textformfiledforadd(
// //                   hint: "Enter the color name",
// //                   controller: colorController,
// //                 ),
// //                 Textformfiledforadd(
// //                   hint: "Enter the Storage name",
// //                   controller: storageController,
// //                 ),
// //                 Textformfiledforadd(
// //                   hint: "Enter the Condition name",
// //                   controller: conditionController,
// //                 ),
// //                 Row(
// //                   children: [
// //                     Padding(
// //                       padding: const EdgeInsets.all(8.0),
// //                       child: Container(
// //                         width: 160,
// //                         height: 50,
// //                         child: Expanded(
// //                             child: TextFormField(
// //                           controller: itemCountController,
// //                           decoration: InputDecoration(
// //                             enabledBorder: OutlineInputBorder(
// //                                 borderRadius: BorderRadius.circular(15)),
// //                             hintText: 'item count',
// //                           ),
// //                         )),
// //                       ),
// //                     ),
// //                     SizedBox(width: 30),
// //                     Padding(
// //                       padding: const EdgeInsets.all(8.0),
// //                       child: Container(
// //                         width: 140,
// //                         height: 50,
// //                         child: Expanded(
// //                             child: TextFormField(
// //                           controller: priceController,
// //                           decoration: InputDecoration(
// //                             enabledBorder: OutlineInputBorder(
// //                                 borderRadius: BorderRadius.circular(15)),
// //                             hintText: 'Per Piece Price',
// //                           ),
// //                         )),
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //                 SizedBox(height: 10),
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: [
// //                     Container(
// //                       width: 110,
// //                       child: ElevatedButton(
// //                         onPressed: addStock,
// //                         child: Text("ADD"),
// //                         style: ElevatedButton.styleFrom(
// //                             backgroundColor: Colors.black,
// //                             foregroundColor: Colors.white),
// //                       ),
// //                     ),
// //                   ],
// //                 )
// //               ],
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: SearchExample(),
//     );
//   }
// }

// class SearchExample extends StatefulWidget {
//   @override
//   _SearchExampleState createState() => _SearchExampleState();
// }

// class _SearchExampleState extends State<SearchExample> {
//   // Original data list
//   final List<String> itemList = [
//     "Apple",
//     "Banana",
//     "Cherry",
//     "Date",
//     "Elderberry",
//     "Fig",
//     "Grape",
//     "Honeydew",
//   ];

//   // Search results
//   List<String> filteredList = [];

//   // To control search input
//   TextEditingController searchController = TextEditingController();

//   @override
//   void initState() {
//     super.initState();
//     filteredList = itemList; // Initial list to show all items
//     searchController
//         .addListener(_search); // Adding listener to search controller
//   }

//   // Function for filtering search
//   void _search() {
//     setState(() {
//       String searchText = searchController.text.toLowerCase();
//       filteredList = itemList
//           .where((item) => item.toLowerCase().contains(searchText))
//           .toList();
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Search Example"),
//       ),
//       body: Column(
//         children: [
//           // Search bar
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: searchController,
//               decoration: InputDecoration(
//                 hintText: "Search...",
//                 prefixIcon: Icon(Icons.search),
//                 border: OutlineInputBorder(
//                   borderRadius: BorderRadius.circular(10.0),
//                 ),
//               ),
//             ),
//           ),
//           // Display search results
//           Expanded(
//             child: ListView.builder(
//               itemCount: filteredList.length,
//               itemBuilder: (context, index) {
//                 return ListTile(
//                   title: Text(filteredList[index]),
//                 );
//               },
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

class TwoButtonsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Two Buttons Example"),
      ),
      body: Center(
        child: Text("Main Content Area"),
      ),
      bottomNavigationBar: Container(
        color: Colors.white, // Background color
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  print("First Button Clicked");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "First Button",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: ElevatedButton(
                onPressed: () {
                  print("Second Button Clicked");
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Text(
                  "Second Button",
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(home: TwoButtonsScreen()));
}
