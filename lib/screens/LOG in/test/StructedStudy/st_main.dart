import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/screens/LOG%20in/test/StructedStudy/sales_revenuce.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StockItemsAdapter());
  Hive.registerAdapter(SaleitemsAdapter());
  Hive.registerAdapter(CreateAccountAdapter());
  await Hive.openBox<StockItems>("stockitem_box");
  await Hive.openBox<List<dynamic>>("saleadd_box");
  await Hive.openBox<CreateAccount>("Create_Account");
  runApp(const Study());
}

class Study extends StatelessWidget {
  const Study({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SalesRevenue(),
    );
  }
}
