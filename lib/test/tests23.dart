import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  await Hive.initFlutter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hive CRUD Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: SaleCRUDScreen(),
    );
  }
}

class SaleCRUDScreen extends StatefulWidget {
  @override
  _SaleCRUDScreenState createState() => _SaleCRUDScreenState();
}

class _SaleCRUDScreenState extends State<SaleCRUDScreen> {
  late Box<List<dynamic>> saleBox;

  @override
  void initState() {
    super.initState();
    openHiveBox();
  }

  Future<void> openHiveBox() async {
    // Initialize the global saleBox variable
    saleBox = await Hive.openBox<List<dynamic>>("saleadd_box");
    setState(() {});
  }

  void createSaleItem() async {
    final saleItem = {
      "saleHivebrand": "Samsung",
      "saleHivemodel": "Galaxy S21",
      "saleHiveColor": "Black",
      "saleHiveStroage": "128GB",
      "saleHiveCondtion": "New",
      "saleHiveitemcount": "5",
      "saleHiveprice": "700",
      "saleimgpath": "path/to/image",
      "empolye": "John Doe",
      "salepurshaceamount": "500",
      "saledate": DateTime.now().toString(),
    };

    // Retrieve existing data (List<dynamic>)
    List<dynamic>? items = saleBox.get('items', defaultValue: []);
    items!.add(saleItem);

    // Save the updated list
    await saleBox.put('items', items);

    setState(() {});
  }

  List<dynamic>? readSaleItems() {
    // Retrieve the list as List<dynamic>
    return saleBox.get('items', defaultValue: []);
  }

  void updateSaleItem(int index) async {
    // Retrieve the existing data
    List<dynamic>? items = saleBox.get('items', defaultValue: []);

    // Update the specific item (dynamic map)
    items![index] = {
      "saleHivebrand": "Updated Brand",
      "saleHivemodel": "Galaxy S21",
      "saleHiveColor": "Black",
      "saleHiveStroage": "256GB",
      "saleHiveCondtion": "Used",
      "saleHiveitemcount": "10",
      "saleHiveprice": "800",
      "saleimgpath": "path/to/image",
      "empolye": "Jane Doe",
      "salepurshaceamount": "600",
      "saledate": DateTime.now().toString(),
    };

    // Save the updated list
    await saleBox.put('items', items);

    setState(() {});
  }

  void deleteSaleItem(int index) async {
    // Retrieve the existing data
    List<dynamic>? items = saleBox.get('items', defaultValue: []);

    // Remove the specific item
    items!.removeAt(index);

    // Save the updated list
    await saleBox.put('items', items);

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final saleItems = readSaleItems();

    return Scaffold(
      appBar: AppBar(
        title: Text("Hive CRUD with List<dynamic>"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed: createSaleItem,
          )
        ],
      ),
      body: saleItems!.isEmpty
          ? Center(child: Text("No items available."))
          : ListView.builder(
              itemCount: saleItems.length,
              itemBuilder: (context, index) {
                final item = saleItems[index] as Map<String, dynamic>;
                return ListTile(
                  title: Text(item['saleHivemodel']),
                  subtitle: Text(item['saleHivebrand']),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => updateSaleItem(index),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => deleteSaleItem(index),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
