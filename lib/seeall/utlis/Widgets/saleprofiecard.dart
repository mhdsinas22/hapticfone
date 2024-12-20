import 'package:flutter/material.dart';

class ProfitCardWidget extends StatelessWidget {
  final double totalProfit;

  const ProfitCardWidget({
    Key? key,
    required this.totalProfit,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Row(
          children: [
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Month of OverAll Profit:-",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "₹$totalProfit",
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Color(0xFF008000)),
              ),
            )
          ],
        ),
      ),
    );
  }
}
