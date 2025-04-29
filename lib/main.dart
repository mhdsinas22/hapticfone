import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/splash/haptic.splash.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
//Hellp
  await Hive.initFlutter();
  Hive.registerAdapter(CreatePinAdapter());
  Hive.registerAdapter(StockItemsAdapter());
  Hive.registerAdapter(SaleitemsAdapter());
  Hive.registerAdapter(CreateAccountAdapter());
  await Hive.openBox<StockItems>("stockitem_box");
  await Hive.openBox<List<dynamic>>("saleadd_box");
  await Hive.openBox<CreateAccount>("Create_Account");
  await Hive.openBox<CreatePin>("Create_pin");
  runApp(const MyWidget());
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      debugShowCheckedModeBanner: false,
      home: splash(),
    );
  }
}
