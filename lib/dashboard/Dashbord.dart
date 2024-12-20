import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:haptic_fone/cardstockhome/cardsaleitem.dart';
import 'package:haptic_fone/dashboard/dashbord_utils.dart';
import 'package:haptic_fone/dashboard/piechartmonth.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/alertitems/alert_dashboraddelet.dart';
import 'package:haptic_fone/functions/sale_revence_functions.dart';
import 'package:haptic_fone/saleinvoice/inovice.dart';
import 'package:haptic_fone/seeall/utlis/seeall.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';

class Dashbord extends StatefulWidget {
  const Dashbord({
    super.key,
  });

  @override
  State<Dashbord> createState() => _DashbordState();
}

DateTime? fromdate;
DateTime? todate;

class _DashbordState extends State<Dashbord> {
  Future<void> loadsalesdata() async {
    allSales = await fetehsalesData();
    setState(() {
      filteredSales = allSales;
      totalSalePrice = calculateTotalSalePrice(allSales);
      totalPurchaseAmount = calculateTotalPurchaseAmount(allSales);
    });
  }

  void applyfilters() {
    setState(() {
      filteredSales = filterSalesByDateRange(
          salesdata: allSales, fromdate: fromdate, toDate: toddate);
      totalSalePrice = calculateTotalSalePrice(filteredSales);
      totalPurchaseAmount = calculateTotalPurchaseAmount(filteredSales);
    });
  }

  void fethaddaccount() {
    final box = Hive.box<CreateAccount>("Create_Account");
    addaccount = box.values.toList();
  }

  @override
  void initState() {
    super.initState();
    loadsalesdata();
    fethaddaccount();
    calculateTotalPrice();
  }

  Future<void> deletstock(Saleitems item) async {
    final box = Hive.box<List<dynamic>>("saleadd_box");
    List<Saleitems>? listtss = box.get("saleKey")?.cast<Saleitems>();
    if (listtss != null) {
      listtss.remove(item);
      await box.put("saleKey", listtss);
    }
    loadsalesdata();
  }

  double calculateTotalPrice() {
    double total = 0;
    for (var item in filteredSales) {
      // Check if saleHiveprice is null or not a valid number
      if (item.saleHiveprice.isNotEmpty) {
        try {
          total += double.parse(item.saleHiveprice);
        } catch (e) {
          print("Invalid price: ${item.saleHiveprice}");
        }
      } else {
        print("Empty or null price found for item: ${item}");
      }
    }
    return total;
  }

  double totalSalePrice = 0.0;
  double totalPurchaseAmount = 0.0;
  double totalProfit = 0.0;
  List<Saleitems> filteredSales = [];
  List<Saleitems> allSales = [];
  List<CreateAccount> addaccount = [];

  DateTime? fromdate;
  DateTime? toddate;
  Future<void> SelectFromdate(BuildContext context) async {
    final DateTime? seleectfromdate = await selectfromdate(context, fromdate);
    if (seleectfromdate != null) {
      fromdate = seleectfromdate;
      applyfilters();
    }
  }

  Future<void> selecttodate(BuildContext context) async {
    final DateTime? Selecttodate =
        await selecttodata(context, fromdate, todate);
    if (Selecttodate != null) {
      toddate = Selecttodate;
      applyfilters();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Text(
          "Dashbord ${addaccount[0].USername}",
          style: const TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Color(0xFF75B809),
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Dropdown and PieChart Section
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () => SelectFromdate(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        foregroundColor: const Color(0xFF75B809)),
                    child: Text(
                      fromdate == null
                          ? "FROM"
                          : "FROM:${DateFormat("yyyy-MM-dd").format(fromdate!)}",
                    ),
                  )),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                      child: ElevatedButton(
                    onPressed: () => selecttodate(context),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        elevation: 5,
                        foregroundColor: const Color(0xFF75B809)),
                    child: Text(toddate == null
                        ? "To"
                        : DateFormat("yyyy-MM-dd").format(toddate!)),
                  ))
                ],
              ),
            ),
            PieChartSample(
              lossAmount: totalPurchaseAmount,
              remainingRevenue: totalSalePrice,
            ),
            const SizedBox(height: 18),

            // Summary Section
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Total Item Sale Count
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(width: 1, color: const Color(0xFF75B809)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "TOTAL ITEM SALE COUNT",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xFF75B809),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            "${filteredSales.length}", // Length of Sale Items
                            style: const TextStyle(
                              color: Color(0xFF75B809),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 12),
                // This Month Overall
                Flexible(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border:
                          Border.all(width: 1, color: const Color(0xFF75B809)),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        const Text(
                          "THIS MONTH OVERALL",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                            color: Color(0xFF75B809),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(7.0),
                          child: Text(
                            calculateTotalPrice().toStringAsFixed(1),
                            style: const TextStyle(
                              color: Color(0xFF75B809),
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Recent Sale Section
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "RECENT SALE",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF75B809),
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const SeeAllScreen()));
                    },
                    child: const Text(
                      "SEE ALL",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF75B809),
                        fontSize: 18,
                      ),
                    ),
                  )
                ],
              ),
            ),
            filteredSales.isEmpty
                ? const Column(
                    children: [
                      SizedBox(
                        height: 50,
                      ),
                      Center(
                          child: Text(
                        "No Sales Available",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      )),
                    ],
                  )
                : Expanded(
                    child: ListView.builder(

                        // shrinkWrap: true,
                        itemCount: filteredSales.length,
                        itemBuilder: (context, index) {
                          final getsaleitem = filteredSales[index];
                          return InkWell(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => InvoiceSaleDetails(
                                        color: getsaleitem.saleHiveColor,
                                        condtion: getsaleitem.saleHiveCondtion,
                                        stroage: getsaleitem.saleHiveStroage,
                                        imgpath: getsaleitem.saleimgpath,
                                        saledate: getsaleitem.saledate,
                                        emplylename: getsaleitem.empolye,
                                        phonenumber: getsaleitem.phonenumber,
                                        saleitem: getsaleitem.saleHivemodel,
                                        itemcount:
                                            getsaleitem.saleHiveitemcount,
                                        totalAmount: getsaleitem.saleHiveprice,
                                        invoiceno: getsaleitem.invoiceno,
                                      )));
                            },
                            child: CardSaledashborad(
                              sale: getsaleitem,
                              ondltsale: () {
                                dltaalert_Dashborad(
                                    context, index, allSales, deletstock);
                              },
                            ),
                          );
                        }),
                  ),
          ],
        ),
      ),
    );
  }
}
