import 'package:flutter/material.dart';

class MangeHome extends StatelessWidget {
  final List<Map<String, dynamic>> stockData;

  MangeHome({required this.stockData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView.builder(
        itemCount: stockData.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  stockData[index]['image'] != null
                      ? Image.file(stockData[index]['image'],
                          width: 100, height: 100)
                      : Container(),
                  Text('Brand: ${stockData[index]['brand']}'),
                  Text('Model: ${stockData[index]['model']}'),
                  Text('Color: ${stockData[index]['color']}'),
                  Text('Storage: ${stockData[index]['storage']}'),
                  Text('Condition: ${stockData[index]['condition']}'),
                  Text('Item Count: ${stockData[index]['itemCount']}'),
                  Text('Price: ${stockData[index]['price']}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
