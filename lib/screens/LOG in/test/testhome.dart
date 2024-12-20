import 'package:flutter/material.dart';

class AddMultipleItemsPage extends StatefulWidget {
  @override
  _AddMultipleItemsPageState createState() => _AddMultipleItemsPageState();
}

class _AddMultipleItemsPageState extends State<AddMultipleItemsPage> {
  List<Map<String, dynamic>> cartItems = [];
  double totalAmount = 0.0;

  void addItem(String itemName, int quantity, double price) {
    setState(() {
      double itemTotal = quantity * price;
      cartItems.add({
        'itemName': itemName,
        'quantity': quantity,
        'price': price,
        'itemTotal': itemTotal,
      });
      totalAmount += itemTotal;
    });
  }

  void clearCart() {
    setState(() {
      cartItems.clear();
      totalAmount = 0.0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Multiple Items"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            // Button to Add Items
            ElevatedButton(
              onPressed: () {
                addItem("Item ${cartItems.length + 1}", 2, 50.0);
              },
              child: Text("Add Item"),
            ),
            SizedBox(height: 10),
            // Display Cart Items
            Expanded(
              child: ListView.builder(
                itemCount: cartItems.length,
                itemBuilder: (context, index) {
                  final item = cartItems[index];
                  return ListTile(
                    title: Text(item['itemName']),
                    subtitle: Text(
                      "Quantity: ${item['quantity']} x ₹${item['price']}",
                    ),
                    trailing: Text("₹${item['itemTotal']}"),
                  );
                },
              ),
            ),
            // Display Total Amount
            Text(
              "Total: ₹$totalAmount",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Clear Cart Button
            ElevatedButton(
              onPressed: clearCart,
              child: Text("Clear Cart"),
            ),
          ],
        ),
      ),
    );
  }
}
