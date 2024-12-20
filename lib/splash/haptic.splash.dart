import 'dart:async';
import 'package:flutter/material.dart';
import 'package:haptic_fone/imagesasstes/image_asset_class.dart';
import 'package:haptic_fone/login_page/login_screen.dart';

// ignore: camel_case_types
class splash extends StatefulWidget {
  splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

// ignore: camel_case_types
class _splashState extends State<splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (context) => Login()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset(
          ImgaeAssetClass.hapticsplashimg,
          height: 300,
        ),
      ),
    );
  }
}
