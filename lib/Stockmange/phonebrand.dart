import 'package:flutter/material.dart';

// ignore: must_be_immutable, camel_case_types
class stbrand extends StatelessWidget {
  String brand;
  stbrand({super.key, required this.brand});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 70,
      height: 20,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        ),
        child: Text(
          brand,
          style: const TextStyle(fontSize: 7),
        ),
      ),
    );
  }
}
