import 'dart:io';
import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';

class CardSaledashborad extends StatelessWidget {
  final Saleitems sale;
  final VoidCallback ondltsale;
  const CardSaledashborad({
    super.key,
    required this.sale,
    required this.ondltsale,
  });

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
                  child: sale.saleimgpath != null
                      ? Image.memory(sale.saleimgpath, width: 100, height: 100)
                      : const Icon(Icons.image_not_supported),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      sale.saleHivemodel,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Storage:${sale.saleHiveStroage}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      "Condtion:-${sale.saleHiveCondtion}",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Color:${sale.saleHiveColor}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      "Empolye:${sale.empolye}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      "PRICE:-₹${sale.saleHiveprice}",
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
                      ondltsale();
                    },
                    icon: const Icon(
                      Icons.delete,
                      color: Colors.red,
                      size: 20,
                    )),
              ],
            ),
          ),
          Positioned(
              bottom: 10,
              right: 10,
              child: Text(
                "Tap to get Invoice",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ))
        ],
      ),
    );
  }
}
