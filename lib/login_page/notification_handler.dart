import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/login_page/notification_serivces.dart';
import 'package:hive/hive.dart';

class NotificationHandler {
  final NotificationService _notificationService = NotificationService();

  void checklowstock() {
    final box = Hive.box<StockItems>("stockitem_box");
    final stockitem = box.values.toList();
    final lowstocitem =
        stockitem.where((item) => item.hiveitemcount == "0").toList();
    final displayitemname = lowstocitem.map((item) => item.hivemodel).join(",");
    if (lowstocitem.isNotEmpty) {
      _notificationService.showNotification(
          " Stock Alert", "Out of stock: $displayitemname");
    }
  }

  void initializeService() {
    _notificationService.initialize();
  }
}
