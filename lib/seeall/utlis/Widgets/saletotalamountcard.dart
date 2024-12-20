import 'package:flutter/material.dart';

class Saletotalamountcard extends StatelessWidget {
  final double totalsaleamount;
  Saletotalamountcard({super.key, required this.totalsaleamount});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Text(
                "Month of OverAll Sale Amount:-  ₹${totalsaleamount}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
