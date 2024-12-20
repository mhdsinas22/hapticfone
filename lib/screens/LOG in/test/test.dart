import 'package:flutter/material.dart';
import 'package:haptic_fone/dashboard/piechartmonth.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  Hive.registerAdapter(StockItemsAdapter());
  Hive.registerAdapter(SaleitemsAdapter());
  Hive.registerAdapter(CreateAccountAdapter());
  await Hive.openBox<StockItems>("stockitem_box");
  await Hive.openBox<List<dynamic>>("saleadd_box");
  await Hive.openBox<CreateAccount>("Create_Account");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SalesRevenueSection(),
    );
  }
}

// SalesRevenueSection class with date range filtering
class SalesRevenueSection extends StatefulWidget {
  const SalesRevenueSection({super.key});

  @override
  State<SalesRevenueSection> createState() => _SalesRevenueSectionState();
}

class _SalesRevenueSectionState extends State<SalesRevenueSection> {
  TextEditingController searchController = TextEditingController();

  // Add separate variables for From and To dates
  DateTime? fromDate;
  DateTime? toDate;
  void filterSalesBySearch(String query) {
    setState(() {
      filteredSalesData = salesData.where((item) {
        final productName = item.saleHivemodel.toLowerCase(); // Product name
        final saleDate = item.saledate; // Sale date
        final searchQuery = query.toLowerCase(); // User input in lowercase
        return productName.contains(searchQuery) ||
            saleDate.contains(searchQuery);
      }).toList();
    });
  }

  // Other variables remain the same
  List<Saleitems> salesData = [];
  List<Saleitems> filteredSalesData = [];
  double totalSalePrice = 0.0;
  double totalPurchaseAmount = 0.0;
  double remainingRevenue = 0.0;

  void fetchSalesData() {
    final box = Hive.box<List<dynamic>>("saleadd_box");
    List<Saleitems>? openbox = box.get("saleKey")?.cast<Saleitems>();
    if (openbox != null) {
      setState(() {
        salesData = openbox; // Add this line
        filteredSalesData = salesData;
        totalSalePrice = salesData.fold(0.0, (sum, item) {
          try {
            return sum + double.parse(item.saleHiveprice.replaceAll("", ""));
          } catch (e) {
            print("Error$e");
            return sum;
          }
        });
        totalPurchaseAmount = salesData.fold(0.0, (sum, item) {
          try {
            return sum +
                double.parse(item.salepurshaceamount.replaceAll("", ""));
          } catch (e) {
            print(e);
            return sum;
          }
        });
      });
      calculateRemainingRevenue();
    } else {
      print("No data found in saleadd_box");
    }
  }

  void calculateRemainingRevenue() {
    remainingRevenue = totalSalePrice - totalPurchaseAmount;
    print(" try:$remainingRevenue");
  }

  // Modify the filter function to handle both From and To date
  void filterSalesByDateRange() {
    if (fromDate == null || toDate == null) {
      setState(() {
        filteredSalesData = salesData; // No date range, show all data
      });
    } else {
      setState(() {
        filteredSalesData = salesData.where((item) {
          final saleDate = DateTime.parse(item.saledate);

          // Adjust this condition to include today's date
          return saleDate.isAfter(fromDate!.subtract(Duration(days: 1))) &&
              (saleDate.isBefore(toDate!.add(Duration(days: 1))) ||
                  saleDate.isAtSameMomentAs(toDate!));
        }).toList();

        totalSalePrice = filteredSalesData.fold(
            0.0,
            (sum, item) =>
                sum + double.parse(item.saleHiveprice.replaceAll(",", "")));
        totalPurchaseAmount = filteredSalesData.fold(
            0.0,
            (sum, item) =>
                sum +
                double.parse(item.salepurshaceamount.replaceAll(",", "")));
      });
    }
    calculateRemainingRevenue();
  }

  // Show DatePicker for From date
  Future<void> selectFromDate(BuildContext context) async {
    final DateTime? newFromDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (newFromDate != null) {
      setState(() {
        fromDate = newFromDate;
        filterSalesByDateRange(); // Apply filter
      });
    }
  }

  // Show DatePicker for To date
  Future<void> selectToDate(BuildContext context) async {
    final DateTime? newToDate = await showDatePicker(
      context: context,
      initialDate: fromDate ?? DateTime.now(),
      firstDate: fromDate ?? DateTime(2020),
      lastDate: DateTime(2101),
    );

    if (newToDate != null) {
      setState(() {
        toDate = newToDate;
        filterSalesByDateRange(); // Apply filter
      });
    }
  }

  @override
  void initState() {
    super.initState();
    fetchSalesData();
    calculateRemainingRevenue();
  }

  @override
  @override
  Widget build(BuildContext context) {
    double lossAmount = totalPurchaseAmount > totalSalePrice
        ? totalPurchaseAmount - totalSalePrice
        : 0.0;

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
            Column(
              children: [
                const Text(
                  "Filter by Date Range:",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    ElevatedButton(
                      onPressed: () => selectFromDate(context),
                      child: Text(
                        fromDate == null
                            ? 'From Date'
                            : 'From ${DateFormat("yyyy-MM-dd").format(fromDate!)}',
                      ),
                    ),
                    const SizedBox(width: 10),
                    ElevatedButton(
                      onPressed: () => selectToDate(context),
                      child: Text(
                        toDate == null
                            ? 'To Date'
                            : 'To: ${DateFormat("yyyy-MM-dd").format(toDate!)}',
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                TextField(
                  controller: searchController,
                  decoration: const InputDecoration(
                    labelText: 'Search by Product Name or Date',
                    border: OutlineInputBorder(),
                    prefixIcon: Icon(Icons.search),
                  ),
                  onChanged: (query) {
                    filterSalesBySearch(query);
                  },
                ),
                const SizedBox(height: 10),
              ],
            ),
            const SizedBox(height: 10),
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
              lossAmount: lossAmount,
              remainingRevenue: remainingRevenue,
            ),
            const SizedBox(height: 20),
            const Text(
              "Recent Sales",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            filteredSalesData.isEmpty
                ? const Center(
                    child: Text(
                      "No Data",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
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
                            subtitle: Text("Date: ${sale.invoiceno}"),
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
