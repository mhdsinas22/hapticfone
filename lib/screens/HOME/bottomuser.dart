import 'package:flutter/material.dart';
import 'package:haptic_fone/dashboard/Dashbord.dart';
import 'package:haptic_fone/PROFILE/profile.dart';
import 'package:haptic_fone/screens/HOME/haptic.home.dart';

class Bottomuser extends StatefulWidget {
  final int selecteddindex;
  const Bottomuser({super.key, required this.selecteddindex});

  @override
  State<Bottomuser> createState() => _BottomuserState();
}

class _BottomuserState extends State<Bottomuser> {
  late int selectindex;

  static List<Widget> items = [Home(), const Dashbord(), const Profile()];
  void fu(int index) {
    setState(() {
      selectindex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    selectindex = widget.selecteddindex;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: selectindex,
        children: items,
      ),
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: selectindex,
          onTap: fu,
          backgroundColor: Colors.white,
          selectedItemColor: const Color(0xFF75B809),
          unselectedItemColor: Colors.black,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: const TextStyle(),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
              ),
              label: "HOME",
            ),
            BottomNavigationBarItem(
                icon: Icon(Icons.pie_chart), label: "DASHBORAD"),
            BottomNavigationBarItem(
                icon: Icon(Icons.person_2_sharp), label: "PROFILE")
          ]),
    );
  }
}
