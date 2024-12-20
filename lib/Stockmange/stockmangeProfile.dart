import 'package:flutter/material.dart';
import 'package:haptic_fone/Stockmange/StockMangeProfileEdit.dart';
import 'package:haptic_fone/alertitems/alertbox1.dart';
import 'package:haptic_fone/login_page/login_screen.dart';

void main() {
  runApp(const Test());
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: StockProfile(),
    );
  }
}

class StockProfile extends StatefulWidget {
  const StockProfile({super.key});

  @override
  State<StockProfile> createState() => _StockProfileState();
}

class _StockProfileState extends State<StockProfile> {
  void needsupport(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("NEED SUPPORT"),
            content: const SizedBox(
              height: 70,
              child: Column(
                children: [
                  Row(
                    children: [
                      Icon(Icons.phone),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "7034266250",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        "haptic.fone@gmail.com",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
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
                width: 105,
                height: 50,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.message,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "CHAT US",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )
                  ],
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: const Color(0xFF75B809),
                ),
                width: 105,
                height: 50,
                child: const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.phone,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      "CALL",
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.white),
                    )
                  ],
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  ),
                  Divider(color: Color(0xFFD9D9D9)),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const EditProfile()));
                },
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage("assest/1.jpg"),
                    ),
                    SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Mohamed Sinaas',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '+91 9048551457',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Sales Man',
                            style: TextStyle(
                                color: Color(0xFFD9D9D9),
                                fontSize: 12,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.chevron_right, size: 40, color: Colors.black),
                  ],
                ),
              ),
            ),
            const Divider(color: Color(0xFFD9D9D9)),
            _buildMenuItem(
              context,
              icon: Icons.person,
              side: "|",
              title: "Change the employee",
              subtitle: "Entry for only stock updating",
              onTap: () {
                Navigator.pushReplacement(
                    context, MaterialPageRoute(builder: (context) => Login()));
              },
            ),
            const Divider(color: Color(0xFFD9D9D9)),
            InkWell(
              onTap: () {
                needsupport(context);
              },
              child: _buildMenuItem(
                context,
                icon: Icons.phone,
                side: "|",
                title: "Need Support",
                subtitle: "Entry for only stock updating",
              ),
            ),
            const Divider(color: Color(0xFFD9D9D9)),
            _buildMenuItem(
              onTap: () {},
              context,
              icon: Icons.lock,
              side: "|",
              title: "Privacy & Policy",
              subtitle: "Entry for only stock updating",
            ),
            const Divider(color: Color(0xFFD9D9D9)),
            InkWell(
              onTap: () {},
              child: _buildMenuItem(
                context,
                icon: Icons.cached,
                side: "|",
                title: "Return Policy",
                subtitle: "Entry for only stock updating",
              ),
            ),
            const Divider(color: Color(0xFFD9D9D9)),
            InkWell(
              onTap: () {},
              child: _buildMenuItem(
                context,
                icon: Icons.dialpad,
                side: "|",
                title: "Create Pin",
                subtitle: "Entry for only stock updating",
              ),
            ),
            const Divider(color: Color(0xFFD9D9D9)),
            InkWell(
              onTap: () => alertbox1(context),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.power_settings_new, size: 40, color: Colors.black),
                  Text(
                    "Log Out",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20),
                  ),
                ],
              ),
            ),
            const Divider(color: Color(0xFFD9D9D9)),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(BuildContext context,
      {required IconData icon,
      required String title,
      required String subtitle,
      required String side,
      Function()? onTap}) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          children: [
            Icon(icon, size: 32),
            Text(
              side,
              style: const TextStyle(color: Color(0xFFD9D9D9), fontSize: 25),
            ),
            const SizedBox(width: 15),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
                Text(
                  subtitle,
                  style:
                      const TextStyle(fontSize: 12, color: Color(0xFFD9D9D9)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
