import 'package:flutter/material.dart';

class AddItemPage extends StatefulWidget {
  final String itemname;
  final String itemprice;
  final String itemcount;

  const AddItemPage({
    super.key,
    required this.itemname,
    required this.itemprice,
    required this.itemcount,
  });

  @override
  State<AddItemPage> createState() => _AddItemPageState();
}

class _AddItemPageState extends State<AddItemPage> {
  final TextEditingController itemNameController = TextEditingController();
  final TextEditingController itemPriceController = TextEditingController();
  final TextEditingController itemCountController = TextEditingController();

  @override
  void initState() {
    super.initState();
    // Initialize controllers with passed values
    itemNameController.text = widget.itemname;
    itemPriceController.text = widget.itemprice;
    itemCountController.text = widget.itemcount;
  }

  // Function to return item data when item is added
  void addItem(BuildContext context) {
    final String itemName = itemNameController.text;
    final double itemPrice = double.tryParse(itemPriceController.text) ?? 0.0;
    final int itemCount = int.tryParse(itemCountController.text) ?? 1;

    if (itemName.isNotEmpty && itemPrice > 0 && itemCount > 0) {
      // Create the item map
      final Map<String, dynamic> newItem = {
        'Item': itemName,
        'Price': itemPrice,
        'itemCount': itemCount,
      };

      // Pass newItem back to the previous screen
      Navigator.pop(context, newItem);
    } else {
      // Show an error if input is invalid
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Please fill out all fields correctly.")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Item"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            // Item Name Input
            TextField(
              controller: itemNameController,
              decoration: const InputDecoration(labelText: 'Item Name'),
            ),
            // Item Price Input
            TextField(
              controller: itemPriceController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Item Price'),
            ),
            // Item Count Input
            TextField(
              controller: itemCountController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Item Count'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => addItem(context),
              child: const Text("Add Item"),
            ),
          ],
        ),
      ),
    );
  }
}
