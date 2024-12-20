import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';

class SaleItemCard extends StatelessWidget {
  final Uint8List imgpath;
  final String saleItem;
  final String storage;
  final String condition;
  final String color;

  const SaleItemCard({
    super.key,
    required this.imgpath,
    required this.saleItem,
    required this.storage,
    required this.condition,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      color: Colors.white,
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: imgpath.isNotEmpty
                ? Image.memory(
                    imgpath ?? Uint8List(0),
                    width: 100,
                    height: 100,
                  )
                : const Icon(Icons.image_not_supported),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                saleItem,
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              Text(
                "Storage: $storage",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
              Text(
                "Condition: $condition",
                style:
                    const TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
              Text(
                "Color: $color",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
