import 'dart:io';
import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/screens/HOME/phoneinformation.dart';

class PhoneCard extends StatelessWidget {
  final StockItems stockhome;

  const PhoneCard({required this.stockhome, super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Phoneinformation(
            pusrhamnout: stockhome.purschaseprice,
            brand: stockhome.hivebrand,
            imgpath: stockhome.hiveimg,
            reamingstock: stockhome.hiveitemcount,
            Model: stockhome.hivemodel,
            Color: stockhome.hivecolor,
            Storage: stockhome.hivestorage,
            condtion: stockhome.hivecondtion,
            price: stockhome.hiveprice,
          ),
        ));
      },
      child: Card(
        color: Colors.white,
        elevation: 5,
        child: Column(
          children: [
            Expanded(
              // ignore: unnecessary_null_comparison
              child: stockhome.hiveimg != null
                  ? Image.memory(
                      stockhome.hiveimg,
                      width: 100,
                      height: 100,
                    )
                  : const Icon(Icons.image_not_supported),
            ),
            Text(
              "${stockhome.hivemodel}",
              style: const TextStyle(
                color: Color(0xFF75B809),
                fontWeight: FontWeight.bold,
              ),
            ),
            const Text(
              "More>>",
              style: TextStyle(
                  color: Color(0xFF75B809), fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
