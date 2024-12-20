import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:hive_flutter/hive_flutter.dart';

Future<List<Saleitems>> fetehsalesData() async {
  final box = Hive.box<List<dynamic>>("saleadd_box");
  List<Saleitems>? openboxx = box.get("saleKey")?.cast<Saleitems>();
  return openboxx ?? [];
}

double calculateTotalSalePrice(List<Saleitems> saledata) {
  return saledata.fold(0.0, (sum, item) {
    try {
      return sum + double.parse(item.saleHiveprice.replaceAll("", ""));
    } catch (e) {
      return sum;
    }
  });
}

double calculateTotalPurchaseAmount(List<Saleitems> saledata) {
  return saledata.fold(0.0, (sum, item) {
    try {
      return sum + double.parse(item.salepurshaceamount.replaceAll("", ""));
    } catch (e) {
      return sum;
    }
  });
}

List<Saleitems> filterSalesByDateRange(
    {required List<Saleitems> salesdata,
    DateTime? fromdate,
    DateTime? toDate}) {
  if (fromdate == null || toDate == null) {
    return salesdata;
  }

  return salesdata.where((item) {
    final saledate = DateTime.parse(item.saledate);
    return saledate.isAfter(fromdate.subtract(const Duration(days: 1))) &&
            (saledate.isBefore(toDate.add(Duration(days: 1)))) ||
        saledate.isAtSameMomentAs(toDate);
  }).toList();
}
