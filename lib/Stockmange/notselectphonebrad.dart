import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Notbrand extends StatelessWidget {
  String brand;
  final double fontsize;
  final double width;
  final double height;
  Notbrand(
      {super.key,
      required this.brand,
      this.fontsize = 20,
      this.width = 10,
      this.height = 10});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          side: const BorderSide(),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
        ),
        child: Text(
          brand,
          style: TextStyle(fontSize: fontsize, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
