import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';

void dltalert(BuildContext context, int index, List<StockItems> fetchitems,
    Function deletstock) {
  int stockey = fetchitems[index].key;
  showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          iconColor: Color(0xFF77B60B),
          title: Text(
            "Are you sure",
            style: TextStyle(color: Color(0xFF77B60B)),
          ),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text("Cancel"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF77B60B)),
            ),
            ElevatedButton(
              onPressed: () {
                deletstock(stockey);

                Navigator.of(context).pop();
              },
              child: Text("Sure"),
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Color(0xFF77B60B)),
            ),
          ],
        );
      });
}
