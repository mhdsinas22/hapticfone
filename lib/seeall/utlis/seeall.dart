import 'package:flutter/material.dart';
import 'package:haptic_fone/dashboard/dashbord_utils.dart';
import 'package:haptic_fone/dashboard/piechartmonth.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/functions/sale_revence_functions.dart';
import 'package:haptic_fone/screens/LOG%20in/test/StructedStudy/utils.dart';
import 'package:haptic_fone/seeall/utlis/Widgets/saleprofiecard.dart';
import 'package:haptic_fone/seeall/utlis/Widgets/saleslist.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class SeeAllScreen extends StatefulWidget {
  const SeeAllScreen({super.key});

  @override
  State<SeeAllScreen> createState() => _SeeAllScreenState();
}

class _SeeAllScreenState extends State<SeeAllScreen> {
  double totalSalePrice = 0.0;
  double totalpurshcaseamonut = 0.0;
  double totalProfit = 0.0;
  List<Saleitems> filteredSales = [];
  List<Saleitems> allSales = [];

  Future<void> loadsaledate() async {
    allSales = await fetchSalesData();
    setState(() {
      filteredSales = allSales;
      totalSalePrice = calculateTotalSalePrice(allSales);
      totalpurshcaseamonut = calculateTotalPurchaseAmount(allSales);
      totalProfit = totalSalePrice - totalpurshcaseamonut;
    });
  }

  DateTime? fromdate;
  DateTime? todate;

  Future<void> frompickdate(BuildContext context) async {
    final DateTime? newtodate = await selectfromdate(context, fromdate);
    if (newtodate != null) {
      setState(() {
        fromdate = newtodate;
        applyfilters();
      });
    }
  }

  Future<void> deletstock1(Saleitems item) async {
    final box = Hive.box<List<dynamic>>("saleadd_box");
    List<Saleitems>? listtss = box.get("saleKey")?.cast<Saleitems>();
    if (listtss != null) {
      listtss.remove(item);
      await box.put("saleKey", listtss);
    }
    loadsaledate();
  }

  Future<void> topickdate(BuildContext context) async {
    final DateTime? selecttodate =
        await selecttodata(context, fromdate, todate);
    if (selecttodate != null) {
      setState(() {
        todate = selecttodate;
        applyfilters();
      });
    }
  }

  void applyfilters() {
    setState(() {
      filteredSales = filterSalesByDateRange(
          salesdata: allSales, fromdate: fromdate, toDate: todate);
      totalSalePrice = calculateTotalSalePrice(filteredSales);
      totalpurshcaseamonut = calculateTotalPurchaseAmount(filteredSales);
      totalProfit = totalSalePrice - totalpurshcaseamonut;
    });
  }

  @override
  void initState() {
    super.initState();
    loadsaledate();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(255, 255, 255, 1),
      appBar: AppBar(
        foregroundColor: Color(0xFF75B809),
        backgroundColor: Colors.white,
        title: const Text("All Sales"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => frompickdate(context),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 5,
                          foregroundColor: const Color(0xFF75B809)),
                      child: Text(fromdate == null
                          ? "FROM"
                          : DateFormat("yyyy-MM-dd").format(fromdate!)),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => topickdate(context),
                      child: Text(todate == null
                          ? "TO"
                          : DateFormat("yyyy-MM-dd").format(todate!)),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          elevation: 5,
                          foregroundColor: const Color(0xFF75B809)),
                    ),
                  ),
                ],
              )),
          PieChartSample(
              remainingRevenue: totalSalePrice,
              lossAmount: totalpurshcaseamonut),
          ProfitCardWidget(totalProfit: totalProfit),
          Expanded(
            child: SalesListWidget(
              fetchitems: deletstock1,
              salesList: filteredSales,
              onDelete: (index) => deletstock1, // Replace logic
              onEdit: (index) => print("Edit $index"), // Replace logic
            ),
          ),
        ],
      ),
    );
  }
}
