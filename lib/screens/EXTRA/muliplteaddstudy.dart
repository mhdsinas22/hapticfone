import 'package:flutter/material.dart';
import 'package:haptic_fone/cardstockhome/nookamammkeset.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:hive/hive.dart';

class Nookam1 extends StatefulWidget {
  const Nookam1({super.key});

  @override
  State<Nookam1> createState() => _Nookam1State();
}

class _Nookam1State extends State<Nookam1> {
  List<StockItems> fetchdata = [];
  void fetchhomedata() {
    final box = Hive.box<StockItems>("stockitem_box");
    setState(() {
      fetchdata = box.values.toList();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchhomedata();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CARD"),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: fetchdata.length,
                itemBuilder: (context, index) {
                  StockItems stock = fetchdata[index];
                  return Nookam(
                    stock: stock,
                    ondlt: () {},
                    onedit: () {},
                  );
                }),
          )
        ],
      ),
    );
  }
}
