import 'dart:io';
import 'package:flutter/material.dart';
import 'package:haptic_fone/alertitems/privayandalert.dart';
import 'package:haptic_fone/alertitems/return_alert.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/PROFILE/profileedit.dart';
import 'package:haptic_fone/Stockmange/Stockmange.dart';
import 'package:haptic_fone/alertitems/alertbox1.dart';
import 'package:haptic_fone/imagesasstes/image_asset_class.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:url_launcher/url_launcher.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  List<CreateAccount> fetchaccountdata = [];
  void createfetchg() {
    final box = Hive.box<CreateAccount>("Create_Account");
    fetchaccountdata = box.values.toList();
  }

  @override
  void initState() {
    super.initState();
    createfetchg();
  }

  void needsupport(BuildContext context) async {
    final double screenWidth = MediaQuery.of(context).size.width;

    Future<void> _makePhoneCall(String phoneNumber) async {
      final Uri launchUri = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      if (await canLaunchUrl(launchUri)) {
        await launchUrl(launchUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Cannot launch dialer")),
        );
      }
    }

    Future<void> _sendEmail(String emailAddress) async {
      final Uri mailtoUri = Uri(
        scheme: 'mailto',
        path: emailAddress,
        query:
            'subject=Support Needed&body=Hello, I need assistance.', // Optional
      );
      if (await canLaunchUrl(mailtoUri)) {
        await launchUrl(mailtoUri);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Cannot open email client")),
        );
      }
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          title: const Text("NEED SUPPORT"),
          content: SizedBox(
            height: screenWidth * 0.2,
            child: Column(
              children: [
                Row(
                  children: [
                    const Icon(Icons.phone),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      "7034266250",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.05,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: screenWidth * 0.03),
                Row(
                  children: [
                    const Icon(Icons.email),
                    SizedBox(width: screenWidth * 0.01),
                    Text(
                      "haptic.fone@gmail.com",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: screenWidth * 0.045,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          actions: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFF75B809),
              ),
              width: screenWidth * 0.3,
              height: screenWidth * 0.12,
              child: TextButton(
                onPressed: () => _makePhoneCall("7034266250"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.phone, color: Colors.white),
                    SizedBox(width: screenWidth * 0.02),
                    const Text(
                      "CALL",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: const Color(0xFF75B809),
              ),
              width: screenWidth * 0.3,
              height: screenWidth * 0.12,
              child: TextButton(
                onPressed: () => _sendEmail("haptic.fone@gmail.com"),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.email, color: Colors.white),
                    SizedBox(width: screenWidth * 0.02),
                    const Text(
                      "EMAIL",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: ListView(
          children: [
            const SizedBox(height: 30),
            const Center(
              child: Column(
                children: [
                  Text(
                    "Profile",
                    style: TextStyle(
                      fontSize: 25,
                      color: Color(0xFF75B809),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Divider(color: Color(0xFFD9D9D9), thickness: 1),
                ],
              ),
            ),
            buildProfileRow(),
            const Divider(color: Color(0xFFD9D9D9), thickness: 1),
            buildMenuOption(
              icon: Icons.admin_panel_settings,
              title: "Stock Manage",
              subtitle: "Entry for only stock updating",
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Stockmange()),
                );
              },
            ),
            const Divider(color: Color(0xFFD9D9D9), thickness: 1),
            buildMenuOption(
              icon: Icons.phone,
              title: "Need Support",
              subtitle: "Entry for only stock updating",
              onTap: () {
                needsupport(context);
              },
            ),
            const Divider(color: Color(0xFFD9D9D9), thickness: 1),
            buildMenuOption(
              icon: Icons.lock,
              title: "Privacy & Policy",
              subtitle: "Entry for only stock updating",
              onTap: () {
                Pricvay(context);
              },
            ),
            const Divider(color: Color(0xFFD9D9D9), thickness: 1),
            buildMenuOption(
              icon: Icons.cached,
              title: "Return Policy",
              subtitle: "Entry for only stock updating",
              onTap: () {
                returnAlert(context);
              },
            ),
            const Divider(color: Color(0xFFD9D9D9), thickness: 1),
            buildLogOutOption(),
            const Divider(color: Color(0xFFD9D9D9), thickness: 1),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    ImgaeAssetClass.hapticloginimg,
                    width: screenWidth * 0.3,
                    height: 50,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "2024 | Haptic.it Pvt.Ltd",
                    style: TextStyle(color: Color(0xFFD9D9D9)),
                  ),
                  const Text(
                    "1.00 | App Version",
                    style: TextStyle(color: Color(0xFFD9D9D9)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildProfileRow() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 30.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const ProfileEdit()));
        },
        child: Row(
          children: [
            const SizedBox(width: 80),
            CircleAvatar(
              radius: 20,
              backgroundImage: fetchaccountdata.isNotEmpty &&
                      fetchaccountdata[0].createimg.isNotEmpty
                  ? MemoryImage((fetchaccountdata[0]
                      .createimg)) // Hive data ninn profile image
                  : const AssetImage("assets/3.png")
                      as ImageProvider, // Default image
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fetchaccountdata[0].USername,
                    style: const TextStyle(
                      color: Color(0xFF75B809),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "+91${fetchaccountdata[0].phonenumber}",
                    style: const TextStyle(
                      color: Color(0xFF75B809),
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'Sales Man',
                    style: TextStyle(
                      color: Color(0xFFD9D9D9),
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(
              Icons.chevron_right,
              size: 40,
              color: Color(0xFF75B809),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildMenuOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12.0),
        child: Row(
          children: [
            const SizedBox(width: 80),
            Icon(icon, size: 32),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 10,
                      color: Color(0xFFD9D9D9),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildLogOutOption() {
    return InkWell(
      onTap: () {
        alertbox1(context);
      },
      child: Column(
        children: [
          IconButton(
            onPressed: () {
              alertbox1(context);
            },
            icon: const Icon(
              Icons.power_settings_new,
              size: 40,
            ),
          ),
          const Text(
            "Log Out",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
