// lib/services/db_service.dart
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:hive/hive.dart';

class DBService {
  // Fetch stock items from the Hive box
  Future<List<StockItems>> fetchStockItems() async {
    final box = await Hive.openBox<StockItems>("stockitem_box");
    return box.values.toList();
  }

  // Fetch account data from the Hive box
  Future<List<CreateAccount>> fetchCreateAccountData() async {
    final box = await Hive.openBox<CreateAccount>("Create_Account");
    return box.values.toList();
  }
}
