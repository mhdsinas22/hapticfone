import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';

class DropDownMonth extends StatefulWidget {
  const DropDownMonth({super.key});

  @override
  State<DropDownMonth> createState() => _DropDownMonthState();
}

class _DropDownMonthState extends State<DropDownMonth> {
  List<Saleitems> fetchsaleitem = [];
  String? selectItem; // Change variable name to follow camel case
  final List<String> items1 = [
    "January",
    "February",
    "March",
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];

  @override
  Widget build(BuildContext context) {
    // Add curly braces here
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: Colors.transparent),
          borderRadius: BorderRadius.circular(5)),
      child: DropdownButton<String>(
        dropdownColor: Colors.white,
        style: const TextStyle(color: Color(0xFF75B809)),
        hint: const Text(
          'Select a month',
          style: TextStyle(color: Color(0xFF75B809)),
        ), // Change hint to be relevant
        value: selectItem,
        items: items1.map((String item) {
          return DropdownMenuItem<String>(
            value: item,
            child: Text(item),
          );
        }).toList(),
        onChanged: (String? newValue) {
          setState(() {
            selectItem = newValue;
          });
        },
      ),
    );
  }
}
