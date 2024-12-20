import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DropDownSeeall extends StatelessWidget {
  DateTime fromdate;
  DateTime todate;
  final String selectedvalue;
  final ValueChanged<dynamic?> onchanged;
  DropDownSeeall(
      {super.key,
      required this.onchanged,
      required this.selectedvalue,
      required this.fromdate,
      required this.todate});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {}, child: Text("FROM"));
    // DropdownButton<dynamic>(
    // dropdownColor: Colors.white,
    // value: selectedvalue,
    // items: [
    //   "ALL",
    //   "January",
    //   "February",
    //   "March",
    //   "April",
    //   "May",
    //   "June",
    //   "July",
    //   "August",
    //   "September",
    //   "October",
    //   "November",
    //   "December"
    // ].map((month) {
    //   return DropdownMenuItem(
    //     child: Text(month),
    //     value: month,
    //   );
    // }).toList(),
    // onChanged: onchanged);
  }
}
