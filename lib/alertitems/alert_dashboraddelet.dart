import 'package:flutter/material.dart';

import '../database/db_stockitems.dart';

void dltaalert_Dashborad(BuildContext context, int index,
    List<Saleitems> saleitems, Function fetchitems) {
  final key = saleitems[index];
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          iconColor: const Color(0xFF77B60B),
          title: const Text(
            "Are you sure",
            style: TextStyle(color: Color(0xFF77B60B)),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF77B60B)),
              child: Text("Cancel"),
            ),
            ElevatedButton(
              onPressed: () {
                fetchitems(key);
                Navigator.of(context).pop();
              },
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color(0xFF77B60B)),
              child: const Text("Sure"),
            ),
          ],
        );
      });
}
