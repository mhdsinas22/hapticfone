// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:image_picker/image_picker.dart';

// void main() {
//   runApp(Stateless());
// }

// class Stateless extends StatelessWidget {
//   const Stateless({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: imagestudy(),
//     );
//   }
// }

// class imagestudy extends StatefulWidget {
//   const imagestudy({super.key});

//   @override
//   State<imagestudy> createState() => _imagestudyState();
// }

// class _imagestudyState extends State<imagestudy> {
//   File? _image;
//   Future<void> pickimage() async {
//     final picker =
//         ImagePicker(); // ith gallery or cameria image pickcheyyneusernne
//     final PickedFile = await picker.pickImage(
//         source: ImageSource
//             .gallery); // ith usernne gallerynne ann slect cheynne pattane allocatowcheythu
//     setState(() {
//       if (PickedFile != null) {
//         _image = File(PickedFile.path);
//       } else {
//         print("Not Image");
//       }
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Column(
//         children: <Widget>[
//           _image != null
//               ? Image.file(
//                   _image!,
//                   width: 200,
//                   height: 200,
//                 )
//               : Text("NOt have image"),
//           ElevatedButton(
//               onPressed: pickimage, child: Text("Slect for gelaary image"))
//         ],
//       ),
//     );
//   }
// }
