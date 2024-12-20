import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';

Future<DateTime?> selectfromdate(
    BuildContext context, DateTime? updatefromdate) async {
  return await showDatePicker(
      context: context,
      initialDate: updatefromdate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(3000));
}

Future<DateTime?> selecttodata(
    BuildContext context, DateTime? fromdate, DateTime? todate) async {
  return await showDatePicker(
    context: context,
    initialDate: DateTime.now(),
    firstDate: DateTime(2022),
    lastDate: DateTime(3000),
  );
}

void filterddata(List<Saleitems> salesdata, List<Saleitems> filtredsalesdata,
    DateTime? fromdate, DateTime? todate, Function calacuaterofit) {
  if (fromdate == null || todate == null) {
    filtredsalesdata.clear();
    filtredsalesdata.addAll(salesdata);
  } else {
    filtredsalesdata.clear();
    filtredsalesdata.addAll(salesdata.where((item) {
      final saledate = DateTime.parse(item.saledate);
      return saledate.isAfter(fromdate.subtract(Duration(days: 1))) &&
              saledate.isBefore(todate.add(Duration(days: 1))) ||
          saledate.isAtSameMomentAs(todate);
    }).toList());
  }
}
