import 'package:flutter/material.dart';

class Monthperioddropdown extends StatefulWidget {
  const Monthperioddropdown({super.key});

  @override
  State<Monthperioddropdown> createState() => _DropDownMonthState();
}

class _DropDownMonthState extends State<Monthperioddropdown> {
  String? selectItem; // Change variable name to follow camel case
  final List<String> items1 = [
    "1-5",
    "6-10",
    "11-15",
    '16-20',
    "21-25",
    '26-30'
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
          'Select a period ',
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
