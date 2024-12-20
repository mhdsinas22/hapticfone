import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_functions.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/imagesasstes/image_asset_class.dart';
import 'package:haptic_fone/splash/haptic.splash.dart';
import 'package:image_picker/image_picker.dart';

class Forgotpawsswordui extends StatefulWidget {
  final Function(Map<String, dynamic>) onaddacount;
  const Forgotpawsswordui({super.key, required this.onaddacount});

  @override
  State<Forgotpawsswordui> createState() => _ForgotpawssworduiState();
}

class _ForgotpawssworduiState extends State<Forgotpawsswordui>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _animation;
  TextEditingController emailadress = TextEditingController();
  TextEditingController username = TextEditingController();
  TextEditingController phonenumber = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController city = TextEditingController();
  // ignore: non_constant_identifier_names
  Uint8List? Createccountimg;
  Future<void> pickimage() async {
    final picker = ImagePicker();
    final XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      final imagebytes = await pickedFile.readAsBytes();
      setState(() {
        Createccountimg = imagebytes;
      });

      // Update Hive database with new image path
    }
  }

  List<CreateAccount> forgotaccount = [];
  void saveDetails() {
    if (forgotaccount.isNotEmpty) {
      forgotaccount[0].USername = username.text;
      forgotaccount[0].password = password.text;
      forgotaccount[0].Email = emailadress.text;
      forgotaccount[0].phonenumber = phonenumber.text;
      forgotaccount[0].city = city.text;
      forgotaccount[0].save(); // Save to Hive
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Profile details updated successfully")),
      );
    } else {
      print("No profile data to update");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );
    _animation = Tween<Offset>(
      begin: Offset(0, 1), // Start off-screen
      end: Offset(0, 0), // End on-screen
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));
  }

  void showCustomSnackbar(BuildContext context) {
    _controller.forward();
    final overlay = Overlay.of(context);
    final overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: 50,
        left: 20,
        right: 20,
        child: SlideTransition(
          position: _animation,
          child: Material(
            elevation: 10,
            borderRadius: BorderRadius.circular(8),
            color: Colors.red,
            child: const Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Oops! You need to select an image before moving forward.",
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Automatically remove snackbar after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      _controller.reverse().then((_) => overlayEntry.remove());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 50,
                ),
                InkWell(
                  onTap: () {
                    pickimage();
                  },
                  child: const Column(
                    children: [
                      CircleAvatar(
                        backgroundImage:
                            AssetImage(ImgaeAssetClass.profileimage),
                        backgroundColor: Colors.white,
                        maxRadius: 50,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: emailadress,
                    decoration: InputDecoration(
                        hintText: "Enter the Email address",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: username,
                    decoration: InputDecoration(
                        hintText: "Enter the UserName",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: phonenumber,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: "Enter the PhoneNumber",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                        hintText: "Enter the password",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    controller: city,
                    decoration: InputDecoration(
                        hintText: "Enter your city",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      if (Createccountimg != null) {
                        AddAccount(
                            image: Createccountimg ?? Uint8List(0),
                            email: emailadress.text,
                            USer: username.text,
                            phonenumber: phonenumber.text,
                            password: password.text,
                            onAddAccount: widget.onaddacount,
                            city: city.text);
                        emailadress.clear();
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => splash()));
                      } else {
                        showCustomSnackbar(context);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF77B60B),
                      foregroundColor: Colors.white,
                    ),
                    child: const Text("Rest Account"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
