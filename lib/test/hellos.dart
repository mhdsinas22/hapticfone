// import 'package:flutter/material.dart';
// import 'package:hapticfone_stock/Stockmange/Stockmange.dart';
// import 'package:hapticfone_stock/alertitems/alertbox1.dart';

// class Profile extends StatefulWidget {
//   const Profile({super.key});

//   @override
//   State<Profile> createState() => _ProfileState();
// }

// class _ProfileState extends State<Profile> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: ListView(
//           children: [
//             Container(
//               height: 30,
//             ),
//             Padding(
//               padding: const EdgeInsets.all(1.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text(
//                     "Profile",
//                     style: TextStyle(
//                         fontSize: 25,
//                         color: Color(0xFF75B809),
//                         fontWeight: FontWeight.bold),
//                   ),
//                   Text(
//                     "___________________________________________________________",
//                     style: TextStyle(color: Color(0xFFD9D9D9)),
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.all(1.0),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: InkWell(
//                       onTap: () {},
//                       child: Column(
//                         children: [
//                           Container(
//                             height: 10,
//                           ),
//                           Row(
//                             children: [
//                               Container(
//                                 width: 20,
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(15.0),
//                                 child: CircleAvatar(
//                                   radius: 20,
//                                   backgroundImage: AssetImage(
//                                     "assest/3.png",
//                                   ),
//                                 ),
//                               ),
//                               SizedBox(
//                                 width: 10,
//                               ),
//                               Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Text(
//                                     'Mohamed Sinaas',
//                                     style: TextStyle(
//                                         color: Color(0xFF75B809),
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     '+91 9048551457',
//                                     style: TextStyle(
//                                         color: Color(0xFF75B809),
//                                         fontSize: 15,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   Text(
//                                     ' Sales Man                 ',
//                                     style: TextStyle(
//                                         color: Color(0xFFD9D9D9),
//                                         fontSize: 13,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(
//                                 width: 80,
//                               ),
//                               IconButton(
//                                   onPressed: () {},
//                                   icon: Icon(
//                                     Icons.chevron_right,
//                                     size: 50,
//                                     color: Color(0xFF75B809),
//                                     weight: 100,
//                                   ))
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   Text(
//                       "___________________________________________________________",
//                       style: TextStyle(color: Color(0xFFD9D9D9))),
//                   InkWell(
//                     onTap: () {
//                       Navigator.pushReplacement(
//                           context,
//                           MaterialPageRoute(
//                               builder: (context) => Stockmange()));
//                     },
//                     child: Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Row(
//                         children: [
//                           Container(
//                             width: 40,
//                           ),
//                           IconButton(
//                             onPressed: () {},
//                             icon: Icon(
//                               Icons.admin_panel_settings,
//                               size: 32,
//                             ),
//                           ),
//                           Text("|"),
//                           SizedBox(
//                             width: 5,
//                           ),
//                           Column(
//                             children: [
//                               Text(
//                                 "Stock Mange     ",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 20),
//                               ),
//                               Text(
//                                 "entry for only stock updating",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 10,
//                                     color: Color(0xFFD9D9D9e)),
//                               )
//                             ],
//                           )
//                         ],
//                       ),
//                     ),
//                   )
//                 ],
//               ),
//             ),
//             Text("___________________________________________________________",
//                 style: TextStyle(color: Color(0xFFD9D9D9))),
//             InkWell(
//               onTap: () {},
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 40,
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.phone,
//                         size: 32,
//                       ),
//                     ),
//                     Text("|"),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           "Need Support     ",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 20),
//                         ),
//                         Text(
//                           "entry for only stock updating",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 10,
//                               color: Color(0xFFD9D9D9e)),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Text("___________________________________________________________",
//                 style: TextStyle(color: Color(0xFFD9D9D9))),
//             InkWell(
//               onTap: () {},
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 40,
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.lock,
//                         size: 32,
//                       ),
//                     ),
//                     Text("|"),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           "Privacy & Policy   ",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 20),
//                         ),
//                         Text(
//                           "entry for only stock updating",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 10,
//                               color: Color(0xFFD9D9D9e)),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Text("___________________________________________________________",
//                 style: TextStyle(color: Color(0xFFD9D9D9))),
//             InkWell(
//               onTap: () {},
//               child: Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Row(
//                   children: [
//                     Container(
//                       width: 40,
//                     ),
//                     IconButton(
//                       onPressed: () {},
//                       icon: Icon(
//                         Icons.keyboard_return,
//                         size: 32,
//                       ),
//                     ),
//                     Text("|"),
//                     SizedBox(
//                       width: 5,
//                     ),
//                     Column(
//                       children: [
//                         Text(
//                           "Return Policy   ",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold, fontSize: 20),
//                         ),
//                         Text(
//                           "entry for only stock updating",
//                           style: TextStyle(
//                               fontWeight: FontWeight.bold,
//                               fontSize: 10,
//                               color: Color(0xFFD9D9D9e)),
//                         )
//                       ],
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Text("___________________________________________________________",
//                 style: TextStyle(color: Color(0xFFD9D9D9))),
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: InkWell(
//                 onTap: () {
//                   alertbox1(context);
//                 },
//                 child: Column(
//                   children: [
//                     Container(
//                       width: 40,
//                     ),
//                     IconButton(
//                       onPressed: () {
//                         alertbox1(context);
//                       },
//                       icon: Icon(
//                         Icons.power_settings_new,
//                         size: 40,
//                       ),
//                     ),
//                     Text(
//                       "Log Out",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                           fontSize: 20),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             Text("___________________________________________________________",
//                 style: TextStyle(color: Color(0xFFD9D9D9))),
//             Image.asset(
//               "assest/2.jpeg",
//               width: 30,
//               height: 50,
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 SizedBox(),
//                 Text(
//                   "2024 |  Haptic.it Pvt.Ltd",
//                   style: TextStyle(color: Color(0xFFD9D9D9)),
//                 ),
//               ],
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Text("1.00|App Version",
//                     style: TextStyle(color: Color(0xFFD9D9D9))),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
