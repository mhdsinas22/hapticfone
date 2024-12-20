import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFormfiledconvert extends StatelessWidget {
  String hint;
  TextEditingController controller2;
  final TextInputType keybordtype;
  TextFormfiledconvert(
      {super.key,
      required this.hint,
      required this.controller2,
      required this.keybordtype});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return "$hint cannot be empty"; // Error message
        }
        return null;
      }, // No error ,
      keyboardType: keybordtype,
      controller: controller2,
      style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey),
        enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: const BorderSide(color: Color(0xFF77B60B))),
      ),
    );
  }
}
