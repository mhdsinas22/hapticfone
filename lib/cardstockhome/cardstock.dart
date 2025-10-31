import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';

class CardStockHome extends StatelessWidget {
  final StockItems stock;
  final VoidCallback ondlt;
  final VoidCallback onedit;
  const CardStockHome(
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
                  // ignore: unrelated_type_equality_checks
                  child: stock.hiveimg != ""
                      ? Image.memory(
                          stock.hiveimg, // Use Image.memory for Uint8List
                          width: 100,
                          height: 100,
                          fit: BoxFit.cover,
                        )
                      : const Icon(Icons.image_not_supported),
                ),

                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   // ignore: unnecessary_null_comparison
                //   child: stock.hiveimg != null
                //       ? Image.file(
                //           File(
                //             stock.hiveimg,
                //           ),
                //           width: 100,
                //           height: 100)
                //       : const Icon(Icons.image_not_supported),
                // ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
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
                        "PURCHASE AMONT:-₹${stock.purschaseprice}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
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
                ),
              ],
            ),
          ),
          Positioned(
            top: 10,
            right: 0,
            child: IconButton(
                onPressed: () {
                  onedit();
                },
                icon: const Icon(
                  Icons.edit,
                  size: 20,
                )),
          ),
          Positioned(
              top: 10,
              right: 29,
              child: IconButton(
                  onPressed: () {
                    ondlt();
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                    size: 20,
                  ))),
          Positioned(
              bottom: 10,
              right: 10,
              child: Text(
                " QTY:${stock.hiveitemcount}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ))
        ],
      ),
    );
  }
}
