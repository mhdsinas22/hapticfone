import 'package:flutter/material.dart';

class Dropdownbrand extends StatefulWidget {
  const Dropdownbrand({super.key});

  @override
  State<Dropdownbrand> createState() => _DropdownbrandState();
}

class _DropdownbrandState extends State<Dropdownbrand> {
  String? selecteditem;
  List<String> items = [
    "APPLE",
    "SAMSUNG",
    "GOOGLE",
    "ONEPLUS",
    "LENNOVO",
    "MOTOROLLA"
  ];
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
        dropdownColor: Colors.white,
        focusColor: Colors.white,
        decoration: const InputDecoration(
            enabledBorder: OutlineInputBorder(),
            labelText: "Select the brand",
            labelStyle: TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder()),
        value: selecteditem,
        onChanged: (newvalue) {
          setState(() {
            selecteditem = newvalue;
          });
        },
        items: items.map((String item) {
          return DropdownMenuItem<String>(value: item, child: Text(item));
        }).toList());
  }
}
