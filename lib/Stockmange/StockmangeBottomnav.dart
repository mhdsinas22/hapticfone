import 'package:flutter/material.dart';
import 'package:haptic_fone/Stockmange/StockAdd.dart';
import 'package:haptic_fone/Stockmange/Stockmagehome.dart';
import 'package:haptic_fone/Stockmange/stockmangeProfile.dart';

class StockBottom extends StatefulWidget {
  StockBottom({
    super.key,
  });

  @override
  State<StockBottom> createState() => _StockBottomState();
}

class _StockBottomState extends State<StockBottom> {
  void onaddstock(Map<String, dynamic> newStock) {
    setState(() {
      stockdata.add(newStock); // Add new stock to the list
      mycurrentndex = 0;
    });
  }

  void onslt(String value) {
    // String value inputted to update the ValueNotifier
    selectedvalue.value = value; // selectedvalue is a ValueNotifier<String>
    setState(() {
      mycurrentndex = 0;
    });
  }

  List<Map<String, dynamic>> stockdata = [];
  ValueNotifier<String> selectedvalue = ValueNotifier<String>("Sealed");
  int mycurrentndex = 0;
  late List<Widget> pages;

  @override
  void initState() {
    super.initState();
    pages = [
      StockMangeHome(
        stockdata: stockdata,
      ), // Corrected here
      StockAdd(
          onaddstock: onaddstock,
          selectedvalue: selectedvalue,
          onselected: onslt), // Corrected here
      StockProfile()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 30,
              offset: Offset(0, 20),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: BottomNavigationBar(
              selectedItemColor: Colors.green,
              unselectedItemColor: Colors.black,
              backgroundColor: Colors.white,
              currentIndex: mycurrentndex,
              onTap: (value) {
                setState(() {
                  mycurrentndex = value;
                });
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: "HOME"),
                BottomNavigationBarItem(
                    icon: Icon(
                      Icons.add_circle,
                    ),
                    label: "ADD"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.person), label: "PROFILE")
              ]),
        ),
      ),
      body: pages[mycurrentndex],
    );
  }
}
