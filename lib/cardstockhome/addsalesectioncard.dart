import 'dart:io';
import 'package:flutter/material.dart';

class AddSaleitems extends StatelessWidget {
  final Map<String, dynamic> items;
  // final Saleitems sale;
  void calacution() {
    items["Price"] * items["Price"];
  }

  final VoidCallback ondltsale;
  final VoidCallback oneditsale;
  AddSaleitems({
    super.key,
    required this.ondltsale,
    required this.oneditsale,
    required this.items,
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
                  child: items["Image"] != null
                      ? Image.memory(items["Image"], width: 100, height: 100)
                      : const Icon(Icons.image_not_supported),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      items["Model"],
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Storage:${items["Straoge"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      "Condtion:-${items["Condtion"]}",
                      style: const TextStyle(
                          fontSize: 12, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "Color:${items["Color"]}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    Text(
                      "PRICE:-₹${items["Price"]}",
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
                "ITEM COUNT:${items["itemcount"]}",
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
              ))
        ],
      ),
    );
  }
}
