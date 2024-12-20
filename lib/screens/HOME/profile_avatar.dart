import 'dart:io';
import 'package:flutter/material.dart';
import 'package:haptic_fone/outofStock/nofications.dart';

class ProfileSection extends StatelessWidget {
  final List fetchaccountdata;

  const ProfileSection({required this.fetchaccountdata, super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        CircleAvatar(
          radius: screenWidth * 0.05,
          backgroundImage: fetchaccountdata.isNotEmpty &&
                  fetchaccountdata[0].createimg != null &&
                  fetchaccountdata[0].createimg.isNotEmpty
              ? MemoryImage((fetchaccountdata[0].createimg)) // Local file image
              : AssetImage("assets/3.png")
                  as ImageProvider, // Fallback asset image
        ),
        SizedBox(width: screenWidth * 0.02),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Welcome",
              style:
                  TextStyle(color: Colors.grey, fontSize: screenWidth * 0.04),
            ),
            Text(
              fetchaccountdata.isNotEmpty
                  ? fetchaccountdata[0].USername
                  : "Guest",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: screenWidth * 0.045,
              ),
            ),
          ],
        ),
        const Spacer(),
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFF77B60B),
            borderRadius: BorderRadius.circular(15),
          ),
          width: screenWidth * 0.1,
          height: screenWidth * 0.1,
          child: IconButton(
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => notifcation()));
            },
            icon: Icon(Icons.notifications,
                color: Colors.white, size: screenWidth * 0.05),
          ),
        ),
      ],
    );
  }
}
