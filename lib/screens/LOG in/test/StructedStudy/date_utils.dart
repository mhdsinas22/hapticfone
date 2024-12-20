import 'package:flutter/material.dart';

Future<DateTime?> selectFromDate(
    BuildContext context, DateTime? fromDate) async {
  return await showDatePicker(
    context: context,
    initialDate: fromDate ?? DateTime.now(),
    firstDate: DateTime(2020),
    lastDate: DateTime(2101),
  );
}

Future<DateTime?> selectToDate(
    BuildContext context, DateTime? fromDate, DateTime? toDate) async {
  return await showDatePicker(
    context: context,
    initialDate: fromDate ?? DateTime.now(),
    firstDate: fromDate ?? DateTime(2020),
    lastDate: DateTime(2101),
  );
}
