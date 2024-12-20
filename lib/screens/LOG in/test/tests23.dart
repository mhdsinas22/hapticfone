// import 'package:flutter/material.dart';
// import 'package:haptic_fone/database/db_stockitems.dart';
// import 'package:haptic_fone/dummy/dummy.dart';
// import 'package:haptic_fone/screens/HOME/bottomuser.dart';
// import 'package:hive/hive.dart';

// class MulipliteSale1 extends StatefulWidget {
//   final String totalamount;
//   final Function(Map<String, dynamic>) onaddsale;

//   const MulipliteSale1({
//     super.key,
//     required this.totalamount,
//     required this.onaddsale,
//   });

//   @override
//   State<MulipliteSale1> createState() => _MulipliteSaleState();
// }

// class _MulipliteSaleState extends State<MulipliteSale1> {
//   final _formKey = GlobalKey<FormState>();
//   TextEditingController phonenumber = TextEditingController();
//   TextEditingController emplyename = TextEditingController();
//   TextEditingController totalamount = TextEditingController();
//   List<Map<String, dynamic>> saleitu = Dummy.addmuiltsale;

//   @override
//   void initState() {
//     super.initState();
//     totalamount.text = widget.totalamount;
//   }

//   Future<void> handleSale() async {
//     if (emplyename.text.isEmpty) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(content: Text("Employee name is required")),
//       );
//       return;
//     }

//     for (var item in saleitu) {
//       try {
//         // Extract and validate data
//         final brand = item["brand"]?.toString() ?? "Unknown";
//         final model = item["Model"]?.toString() ?? "Unknown";
//         final itemCount =
//             int.tryParse(item["itemcount"]?.toString() ?? "0") ?? 0;

//         if (brand == "Unknown" || model == "Unknown" || itemCount <= 0) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Invalid data for item: $model")),
//           );
//           continue;
//         }

//         // Fetch and update stock
//         final stockBox = await Hive.openBox<StockItems>("stockitem_box");
//         final stockItem = stockBox.values.firstWhere(
//           (stock) => stock.hivemodel == model && stock.hivebrand == brand,
//           orElse: () => StockItems(
//             hiveimg: "",
//             hivebrand: "",
//             hivemodel: "",
//             hivecolor: "",
//             hivestorage: "",
//             hivecondtion: "",
//             hiveitemcount: "0",
//             hiveprice: "",
//             purschaseprice: "",
//           ),
//         );

//         final currentStock = int.tryParse(stockItem.hiveitemcount) ?? 0;
//         if (itemCount > currentStock) {
//           ScaffoldMessenger.of(context).showSnackBar(
//             SnackBar(content: Text("Insufficient stock for: $model")),
//           );
//           continue;
//         }

//         // Update stock
//         stockItem.hiveitemcount = (currentStock - itemCount).toString();
//         await stockBox.put(stockItem.key, stockItem);

//         // Add to sales box
//         final salesBox = await Hive.openBox<Map>("salesBox");
//         final saleData = {
//           "brand": brand,
//           "model": model,
//           "itemCount": itemCount,
//           "employee": emplyename.text,
//           "saleDate": DateTime.now().toString(),
//         };
//         await salesBox.add(saleData);

//         // Notify callback
//         widget.onaddsale(saleData);
//       } catch (e) {
//         print("Error processing item: $e");
//       }
//     }

//     ScaffoldMessenger.of(context).showSnackBar(
//       const SnackBar(content: Text("Sale completed successfully!")),
//     );
//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//           builder: (context) => const Bottomuser(selecteddindex: 1)),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Add Sale"),
//       ),
//       body: Form(
//         key: _formKey,
//         child: ListView(
//           padding: const EdgeInsets.all(16.0),
//           children: [
//             TextFormField(
//               controller: emplyename,
//               decoration: const InputDecoration(labelText: "Employee Name"),
//             ),
//             const SizedBox(height: 10),
//             ...saleitu.map((item) => ListTile(
//                   title: Text(item["Model"] ?? "Unknown"),
//                   subtitle: Text("Count: ${item["itemcount"] ?? 0}"),
//                 )),
//             ElevatedButton(
//               onPressed: handleSale,
//               child: const Text("Complete Sale"),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
