import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/outofStock/notfication_card.dart';
import 'package:hive/hive.dart';

class notifcation extends StatefulWidget {
  const notifcation({super.key});

  @override
  State<notifcation> createState() => _notifcationState();
}

class _notifcationState extends State<notifcation> {
  List<StockItems> stock = [];
  void fetchstokcitems() {
    final box = Hive.box<StockItems>("stockitem_box");
    final allitems = box.values.toList();
    stock = allitems.where((item) => item.hiveitemcount == "0").toList();
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchstokcitems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          stock.isEmpty
              ? const Center(
                  child: Text(
                  "No nofications",
                  style: TextStyle(fontSize: 20, color: Color(0xFFD9D9D9)),
                ))
              : Expanded(
                  child: ListView.builder(
                    itemCount: stock.length,
                    itemBuilder: (context, index) {
                      final setstock = stock[index];
                      return OutOfStockCard(item: setstock);
                    },
                  ),
                )
        ],
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        foregroundColor: const Color(0xFF77B60B),
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Notfications",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
