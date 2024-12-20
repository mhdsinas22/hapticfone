import 'package:flutter/material.dart';
import 'package:haptic_fone/cardstockhome/chiocechips_salehome.dart';
import 'package:haptic_fone/database/db_serivce.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/login_page/notification_serivces.dart';
import 'package:haptic_fone/screens/HOME/phonecard.dart';
import 'package:haptic_fone/screens/HOME/profile_avatar.dart';
import 'package:haptic_fone/screens/HOME/serach_filed.dart';
import 'package:hive/hive.dart';

class Home extends StatefulWidget {
  Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final NotificationService _notificationService = NotificationService();
  List<StockItems> fetchHomeitems =
      []; //fetch chetyhe data ithilleann store cheyya
  List<CreateAccount> fetchaccountdata = [];
  List<StockItems> filetdfetchHomeiems = [];
  final DBService dbService = DBService();
  void fetchhomedata() {
    final box = Hive.box<StockItems>("stockitem_box");
    setState(() {
      fetchHomeitems = box.values.toList();
      filetdfetchHomeiems = fetchHomeitems;
    });
  }

  void accountfetchdat() {
    final box = Hive.box<CreateAccount>("Create_Account");
    setState(() {
      fetchaccountdata = box.values.toList();
    });
  }

  List<String> homecategorys = [
    "APPLE",
    "SAMSUNG",
    "GOOGLE",
    "ONEPLUS",
    "LENNOVO",
    "MOTOROLLA"
  ];
  String selecteduser = "";
  TextEditingController serachcontroller = TextEditingController();
  String serach = '';
  @override
  void initState() {
    _notificationService.initialize();
    // TODO: implement initState
    super.initState();
    fetchhomedata();
    accountfetchdat();
    serachcontroller.addListener(() {
      setState(() {
        serach = serachcontroller.text.toLowerCase();
        filetdfetchHomeiems = fetchHomeitems.where((item) {
          return item.hivemodel.toLowerCase().contains(serach);
        }).toList();
      });
    });
  }

  Widget build(BuildContext context) {
    // Define screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 10,
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.08, vertical: screenHeight * 0.03),
        child: Column(children: [
          // Responsive Row with CircleAvatar and Notification Icon
          ProfileSection(fetchaccountdata: fetchaccountdata),
          const SizedBox(
            height: 10,
          ),
          SearchField(controller: serachcontroller, width: screenWidth),

          // Responsive Categories Section
          Padding(
            padding: EdgeInsets.symmetric(vertical: screenHeight * 0.01),
            child: Row(
              children: [
                Text(
                  "Categories",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: screenWidth * 0.05,
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                HomeChip(
                  selecteduser: selecteduser,
                  categorys: homecategorys,
                  onselectedcategorys: (String selected) {
                    setState(() {
                      selecteduser = selected;
                      filetdfetchHomeiems = selected.isEmpty
                          ? fetchHomeitems
                          : fetchHomeitems.where((item) {
                              return item.hivebrand.toLowerCase() ==
                                  selected.toLowerCase();
                            }).toList();
                    });
                  },
                )
              ],
            ),
          ),

          // Responsive Phone Details Cards Section
          SizedBox(height: screenHeight * 0.02),
          SizedBox(height: screenHeight * 0.02),
          Expanded(
            child: fetchHomeitems.isEmpty
                ? const Center(
                    child: Text(
                      "No items",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )
                : GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 8,
                            childAspectRatio: 3.5 / 4),
                    itemCount: filetdfetchHomeiems.length,
                    itemBuilder: (context, index) {
                      StockItems stockhome = filetdfetchHomeiems[index];
                      return PhoneCard(stockhome: stockhome);
                    }),
          )
        ]),
      ),
    );
  }
}
