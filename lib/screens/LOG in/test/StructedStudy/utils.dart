import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:hive_flutter/hive_flutter.dart';

/// Fetch Sales Data from Hive
Future<List<Saleitems>> fetchSalesData() async {
  final box = Hive.box<List<dynamic>>("saleadd_box");
  List<Saleitems>? openbox = box.get("saleKey")?.cast<Saleitems>();
  return openbox ?? [];
}

/// Filter Sales Data by Date Range
List<Saleitems> filterSalesByDateRange1({
  required List<Saleitems> salesData,
  DateTime? fromDate,
  DateTime? toDate,
}) {
  if (fromDate == null || toDate == null) {
    return salesData;
  }

  return salesData.where((item) {
    final saleDate = DateTime.parse(item.saledate);
    return saleDate.isAfter(fromDate.subtract(const Duration(days: 1))) &&
        (saleDate.isBefore(toDate.add(const Duration(days: 1))) ||
            saleDate.isAtSameMomentAs(toDate));
  }).toList();
}

/// Calculate Total Sale Price
double calculateTotalSalePricestd(List<Saleitems> salesData) {
  return salesData.fold(0.0, (sum, item) {
    try {
      return sum + double.parse(item.saleHiveprice.replaceAll(",", ""));
    } catch (e) {
      print("Error in Sale Price: $e");
      return sum;
    }
  });
}

/// Calculate Total Purchase Amount
double calculateTotalPurchaseAmountstd(List<Saleitems> salesData) {
  return salesData.fold(0.0, (sum, item) {
    try {
      return sum + double.parse(item.salepurshaceamount.replaceAll(",", ""));
    } catch (e) {
      print("Error in Purchase Amount: $e");
      return sum;
    }
  });
}
