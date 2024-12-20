import 'package:flutter/material.dart';

class Dropdowncondtion extends StatelessWidget {
  final String selectedvalue;
  final ValueChanged<String> onchanged;
  Dropdowncondtion(
      {super.key, required this.selectedvalue, required this.onchanged});
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        dropdownColor: Colors.white,
        focusColor: Colors.white,
        decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(),
            labelText: "Select the Condtion",
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder()),
        value: selectedvalue,
        onChanged: (value) {},
        items: <String>["Sealed", "Non Active", "Unused", "Second"]
            .map((String value) {
          return DropdownMenuItem<String>(value: value, child: Text(value));
        }).toList());
  }
}
