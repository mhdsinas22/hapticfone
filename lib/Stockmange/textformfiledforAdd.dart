import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Textformfiledforadd extends StatelessWidget {
  String hint;
  TextEditingController controller1;

  Textformfiledforadd(
      {super.key, required this.hint, required this.controller1});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller1,
      decoration: InputDecoration(
          hintText: hint,
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}
