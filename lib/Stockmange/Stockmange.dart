// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:hive_flutter/hive_flutter.dart';
// import 'package:haptic_fone/Stockmange/StockmangeBottomnav.dart';
// import 'package:haptic_fone/Stockmange/createpin.dart';
// import 'package:pin_code_fields/pin_code_fields.dart';

// class Stockmange extends StatefulWidget {
//   const Stockmange({super.key});

//   @override
//   State<Stockmange> createState() => _StockmangeState();
// }

// class _StockmangeState extends State<Stockmange> {
//   String? selectedvalue;
//   late StreamController<ErrorAnimationType> errorAnimationController;

//   @override
//   void initState() {
//     super.initState();
//     errorAnimationController = StreamController<ErrorAnimationType>();
//   }

//   @override
//   void dispose() {
//     errorAnimationController.close();
//     super.dispose();
//   }

//   Future<String> getStoredPin() async {
//     var box = await Hive.openBox('appBox');
//     return box.get('pin', defaultValue: ''); // Retrieve the PIN from Hive
//   }

//   @override
//   Widget build(BuildContext context) {
//     // Media query for responsiveness
//     double screenWidth = MediaQuery.of(context).size.width;
//     double screenHeight = MediaQuery.of(context).size.height;

//     return Scaffold(
//       appBar: AppBar(backgroundColor: Colors.white),
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Stack(
//           children: [
//             Column(
//               children: [
//                 // Image Asset (check the correct path in pubspec.yaml)
//                 Center(
//                   child: Image.asset(
//                     "assest/5.png", // Corrected asset path
//                     width:
//                         screenWidth * 0.6, // Scale image based on screen size
//                   ),
//                 ),
//                 // Padding and PinCodeTextField
//                 Padding(
//                   padding: EdgeInsets.all(screenWidth > 600 ? 60.0 : 20.0),
//                   child: PinCodeTextField(
//                     obscuringCharacter: "●",
//                     animationDuration: Duration(seconds: 1),
//                     animationType: AnimationType.scale,
//                     errorAnimationController: errorAnimationController,
//                     appContext: context,
//                     length: 4,
//                     keyboardType: TextInputType.number,
//                     obscureText: true,
//                     pinTheme: PinTheme(
//                       shape: PinCodeFieldShape.circle,
//                       fieldHeight: screenWidth > 600 ? 40 : 20,
//                       fieldWidth: screenWidth > 600 ? 40 : 20,
//                       activeColor: Colors.black,
//                       disabledColor: Colors.black,
//                       inactiveColor: Colors.black,
//                       selectedColor: Colors.green,
//                     ),
//                     onChanged: (value) {},
//                     onCompleted: (value) async {
//                       // Check if the PIN field is empty
//                       if (value.isEmpty) {
//                         // Show a Snackbar if the PIN is empty
//                         ScaffoldMessenger.of(context).showSnackBar(
//                           SnackBar(
//                             content: Text(
//                                 "PIN cannot be empty. Please create a PIN."),
//                             duration: Duration(seconds: 2),
//                             backgroundColor: Colors.red,
//                           ),
//                         );
//                       } else {
//                         // Retrieve the stored PIN from Hive
//                         String storedPin = await getStoredPin();
//                         if (value == storedPin) {
//                           Navigator.of(context).push(MaterialPageRoute(
//                               builder: (context) => StockBottom()));
//                         } else {
//                           errorAnimationController
//                               .add(ErrorAnimationType.shake);
//                         }
//                       }
//                     },
//                   ),
//                 ),
//                 SizedBox(height: screenHeight * 0.1),
//               ],
//             ),
//             Positioned(
//               right: 15,
//               bottom: 400,
//               child: InkWell(
//                 onTap: () {
//                   Navigator.of(context).push(MaterialPageRoute(
//                     builder: (context) => Createpin(
//                       oncreatepin: (p0) {},
//                     ),
//                   ));
//                 },
//                 child: Text(
//                   "Create a Pin?",
//                   style: TextStyle(fontWeight: FontWeight.bold),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:haptic_fone/Stockmange/StockmangeBottomnav.dart';
import 'package:haptic_fone/Stockmange/createpin.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class Stockmange extends StatefulWidget {
  const Stockmange({super.key});

  @override
  State<Stockmange> createState() => _StockmangeState();
}

class _StockmangeState extends State<Stockmange> {
  String? selectedvalue;
  late StreamController<ErrorAnimationType> errorAnimationController;

  @override
  void initState() {
    super.initState();
    errorAnimationController = StreamController<ErrorAnimationType>();
  }

  @override
  void dispose() {
    errorAnimationController.close();
    super.dispose();
  }

  Future<String> getStoredPin() async {
    var box = await Hive.openBox('appBox');
    return box.get('pin', defaultValue: ''); // Retrieve the PIN from Hive
  }

  @override
  Widget build(BuildContext context) {
    // Media query for responsiveness
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    bool isMobile = screenWidth < 600; // Mobile view breakpoint

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Stock Management",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 20.0 : 40.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Image Asset
                Center(
                  child: Image.asset(
                    "assest/5.png",
                    width: isMobile ? screenWidth * 0.6 : screenWidth * 0.3,
                  ),
                ),
                SizedBox(height: isMobile ? 20 : 40),

                // PIN Code Field
                Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: isMobile ? 10 : 60,
                  ),
                  child: PinCodeTextField(
                    obscuringCharacter: "●",
                    animationDuration: Duration(seconds: 1),
                    animationType: AnimationType.scale,
                    errorAnimationController: errorAnimationController,
                    appContext: context,
                    length: 4,
                    keyboardType: TextInputType.number,
                    obscureText: true,
                    pinTheme: PinTheme(
                      shape: PinCodeFieldShape.circle,
                      fieldHeight: isMobile ? 50 : 70,
                      fieldWidth: isMobile ? 50 : 70,
                      activeColor: Colors.black,
                      disabledColor: Colors.black,
                      inactiveColor: Colors.black,
                      selectedColor: Colors.green,
                    ),
                    onChanged: (value) {},
                    onCompleted: (value) async {
                      if (value.isEmpty) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                "PIN cannot be empty. Please create a PIN."),
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ),
                        );
                      } else {
                        String storedPin = await getStoredPin();
                        if (value == storedPin) {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => StockBottom()));
                        } else {
                          errorAnimationController
                              .add(ErrorAnimationType.shake);
                        }
                      }
                    },
                  ),
                ),

                SizedBox(height: isMobile ? 30 : 50),

                // Create Pin Option
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Createpin(
                        oncreatepin: (p0) {},
                      ),
                    ));
                  },
                  child: Text(
                    "Create a Pin?",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: isMobile ? 16 : 20,
                    ),
                  ),
                ),

                SizedBox(height: isMobile ? 20 : 40),

                // Save Button
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => StockBottom()));
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 20 : 40,
                      vertical: isMobile ? 10 : 20,
                    ),
                    backgroundColor: Colors.black,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(
                    "Enter",
                    style: TextStyle(fontSize: isMobile ? 16 : 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
