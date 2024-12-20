import 'dart:io';
import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';

class OutOfStockCard extends StatelessWidget {
  final StockItems item;

  const OutOfStockCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 5,
        color: Colors.white,
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              // ignore: unnecessary_null_comparison
              child: item.hiveimg != null
                  ? Image.memory(
                      item.hiveimg,
                      width: 100,
                      height: 100,
                    )
                  : const Icon(Icons.image_not_supported),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  const Text(
                    "ITEM OUT OF STOCK",
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    item.hivemodel,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
