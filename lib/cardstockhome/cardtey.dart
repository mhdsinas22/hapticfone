import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';

class CardAddMuli extends StatelessWidget {
  final StockItems stock;
  final VoidCallback ondlt;
  final VoidCallback onedit;
  const CardAddMuli(
      {super.key,
      required this.stock,
      required this.ondlt,
      required this.onedit});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Stack(
        children: [
          Card(
            elevation: 5,
            color: Colors.white,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  // ignore: unnecessary_null_comparison
                  child: stock.hiveimg != null
                      ? Image.memory(stock.hiveimg, width: 100, height: 100)
                      : const Icon(Icons.image_not_supported),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      stock.hivemodel,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Storage:${stock.hivestorage}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      "Condtion:-${stock.hivecondtion}",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Color:${stock.hivecolor}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      "PRICE:-₹${stock.hiveprice}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 10,
            child: Row(
              children: [
                IconButton(
                    onPressed: () {
                      ondlt();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 20,
                    )),
                IconButton(
                    onPressed: () {
                      onedit();
                    },
                    icon: const Icon(
                      Icons.edit,
                      size: 20,
                    )),
              ],
            ),
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: Text(
                "ITEM COUNT:${stock.hiveitemcount}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ))
        ],
      ),
    );
  }
}
