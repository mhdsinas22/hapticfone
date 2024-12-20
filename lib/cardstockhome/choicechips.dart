import 'package:flutter/material.dart';

// ignore: must_be_immutable
class Chips extends StatelessWidget {
  List<String> options;
  final String seleted;
  final Function(String) onselectedcat;
  Chips(
      {Key? key,
      required this.options,
      required this.seleted,
      required this.onselectedcat})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
        spacing: 8,
        children: options.map((option) {
          return ChoiceChip(
            showCheckmark: false,
            labelStyle: TextStyle(
                color: seleted == option ? Colors.white : Colors.black),
            selectedColor: Colors.black,
            backgroundColor: Colors.white,
            label: Text(option),
            selected: seleted == option,
            onSelected: (bool isselected) {
              onselectedcat(isselected ? option : "");
            },
          );
        }).toList());
  }
}
