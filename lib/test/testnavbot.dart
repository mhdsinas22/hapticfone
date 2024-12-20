// // import 'package:flutter/material.dart';
// // import 'package:hapticfone_stock/screens/HOME/bottomuser.dart';

// // class Testnav extends StatefulWidget {
// //   const Testnav({super.key});

// //   @override
// //   State<Testnav> createState() => _TestnavState();
// // }

// // class _TestnavState extends State<Testnav> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       bottomNavigationBar: Bottomuser(),
// //     );
// //   }
// // }

// import 'package:flutter/material.dart';
// import 'package:hapticfone_stock/CARDSTOCKHOME/chiocechips_salehome.dart';
// // Ensure correct import if HomeChip is in another file.

// void main() {
//   runApp(const MyApp());
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: HomeScreen(),
//     );
//   }
// }

// class HomeScreen extends StatefulWidget {
//   @override
//   _HomeScreenState createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   String selectedUser = "";
//   List<String> categories = ['Apple', 'Samsung', 'OnePlus', 'Nokia', 'Xiaomi'];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Home Chip Example'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: HomeChip(
//           selecteduser: selectedUser,
//           categorys: categories,
//           onselectedcategorys: (selectedCategory) {
//             setState(() {
//               selectedUser = selectedCategory;
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
