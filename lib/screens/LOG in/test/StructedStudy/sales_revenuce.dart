import 'package:flutter/material.dart';
import 'package:haptic_fone/dashboard/piechartmonth.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/screens/LOG%20in/test/StructedStudy/date_utils.dart';
import 'package:haptic_fone/screens/LOG%20in/test/StructedStudy/utils.dart';
import 'package:intl/intl.dart';

class SalesRevenue extends StatefulWidget {
  const SalesRevenue({super.key});

  @override
  State<SalesRevenue> createState() => _SalesRevenueState();
}

class _SalesRevenueState extends State<SalesRevenue> {
  DateTime? fromDate;
  DateTime? toDate;
  List<Saleitems> salesData = [];
  List<Saleitems> filteredSalesData = [];
  double totalSalePrice = 0.0;
  double totalPurchaseAmount = 0.0;
  double remainingRevenue = 0.0;

  @override
  void initState() {
    super.initState();
    loadSalesData();
  }

  Future<void> loadSalesData() async {
    salesData = await fetchSalesData(); // Fetch data using utility function
    setState(() {
      filteredSalesData = salesData;
      totalSalePrice = calculateTotalSalePricestd(salesData);
      totalPurchaseAmount = calculateTotalPurchaseAmountstd(salesData);
      remainingRevenue = totalSalePrice - totalPurchaseAmount;
    });
  }

  void applyFilter() {
    setState(() {
      filteredSalesData = filterSalesByDateRange1(
        salesData: salesData,
        fromDate: fromDate,
        toDate: toDate,
      );
      totalSalePrice = calculateTotalSalePricestd(filteredSalesData);
      totalPurchaseAmount = calculateTotalPurchaseAmountstd(filteredSalesData);
      remainingRevenue = totalSalePrice - totalPurchaseAmount;
    });
  }

  Future<void> selectFromDateWrapper(BuildContext context) async {
    final DateTime? newFromDate = await selectFromDate(context, fromDate);
    if (newFromDate != null) {
      setState(() {
        fromDate = newFromDate;
        applyFilter();
      });
    }
  }

  Future<void> selectToDateWrapper(BuildContext context) async {
    final DateTime? newToDate = await selectToDate(context, fromDate, toDate);
    if (newToDate != null) {
      setState(() {
        toDate = newToDate;
        applyFilter();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // double lossAmount = totalPurchaseAmount > totalSalePrice
    //     ? totalPurchaseAmount - totalSalePrice
    //     : 0.0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Sales Revenue"),
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Date Range Picker Section
            Column(
              children: [
                const Text(
                  "Filter by Date Range:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => selectFromDateWrapper(context),
                      child: Text(
                        fromDate == null
                            ? 'From Date'
                            : 'From ${DateFormat("yyyy-MM-dd").format(fromDate!)}',
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => selectToDateWrapper(context),
                      child: Text(
                        toDate == null
                            ? 'To Date'
                            : 'To: ${DateFormat("yyyy-MM-dd").format(toDate!)}',
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),

            // Total Revenue Section
            Card(
              color: Colors.green[100],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Remaining Revenue",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          "₹${remainingRevenue.toStringAsFixed(2)}",
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            PieChartSample(
              lossAmount: totalPurchaseAmount,
              remainingRevenue: remainingRevenue,
            ),
            const SizedBox(height: 20),

            // Display Sales Data
            const Text(
              "Recent Sales",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            filteredSalesData.isEmpty
                ? const Center(
                    child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "No Data",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ))
                : Expanded(
                    child: ListView.builder(
                      itemCount: filteredSalesData.length,
                      itemBuilder: (context, index) {
                        final sale = filteredSalesData[index];
                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            leading: const Icon(Icons.shopping_cart),
                            title: Text(sale.saleHivemodel),
                            subtitle: Text("Date: ${sale.saledate}"),
                            trailing: Text("₹${sale.saleHiveprice}"),
                          ),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
