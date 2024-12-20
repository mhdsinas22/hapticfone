// import 'package:flutter/material.dart';
// import 'package:haptic_fone/database/db_stockitems.dart';
// import 'package:haptic_fone/imagesasstes/image_asset_class.dart';
// import 'package:haptic_fone/textFormfileds/textformfiledlogin.dart';
// import 'package:haptic_fone/login_page/forgotpassword.dart';
// import 'package:haptic_fone/login_page/login_logic.dart';
// import 'package:haptic_fone/login_page/login_submission.dart';
// import 'package:haptic_fone/login_page/login_validation.dart';
// import 'package:haptic_fone/login_page/notification_handler.dart';
// import 'package:haptic_fone/login_page/createaccount.dart';
// import 'package:hive_flutter/hive_flutter.dart';

// // ignore: camel_case_types
// class login extends StatefulWidget {
//   login({
//     super.key,
//   });

//   @override
//   State<login> createState() => _loginState();
// }

// // ignore: camel_case_types
// class _loginState extends State<login> {
//   late final NotificationHandler _notificationHandler;
//   late final LoginLogic _logic;
//   late final LoginSubmission _loginSubmission;
//   final _form = GlobalKey<FormState>();
//   final TextEditingController _name = TextEditingController();
//   final TextEditingController _password = TextEditingController();
//   List<CreateAccount> loginside = [];
//   void fetchloginside() {
//     final box = Hive.box<CreateAccount>("Create_Account");
//     setState(() {
//       loginside = box.values.toList();
//     });
//   }

//   @override
//   void initState() {
//     super.initState();
//     fetchloginside();
//     _notificationHandler = NotificationHandler();
//     _notificationHandler.initializeService();
//     final box = Hive.box<CreateAccount>("Create_Account");
//     _logic = LoginLogic(box.values.toList());
//     _loginSubmission = LoginSubmission(
//         context: context,
//         logic: _logic,
//         notificationHandler: _notificationHandler);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Form(
//         key: _form,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Image.asset(
//               ImgaeAssetClass.hapticloginimg,
//               width: 90,
//             ),
//             TextformLoignPage(
//                 controllrt: _name,
//                 label: "User Name",
//                 obsursetext: false,
//                 validator: validateusername),
//             TextformLoignPage(
//                 controllrt: _password,
//                 label: "Password",
//                 obsursetext: true,
//                 validator: validatepassword),
//             Stack(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.end,
//                   children: [
//                     Positioned(
//                         child: InkWell(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => Forgotpawsswordui(
//                                   onaddacount: (p0) {},
//                                 )));
//                       },
//                       child: const Text(
//                         "Forgot Account?",
//                         style: TextStyle(color: Color(0xFF77B60B)),
//                       ),
//                     )),
//                     const SizedBox(
//                       width: 120,
//                     ),
//                     GestureDetector(
//                       onTap: () {
//                         Navigator.of(context).push(MaterialPageRoute(
//                             builder: (context) => CreateaccountUi(
//                                   onaddacount: (p0) {},
//                                 )));
//                       },
//                       child: const Text(
//                         "Create Account?",
//                         style: TextStyle(color: Color(0xFF77B60B)),
//                       ),
//                     ),
//                     const SizedBox(
//                       width: 30,
//                       height: 40,
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//             const SizedBox(
//               height: 10,
//             ),
//             SizedBox(
//               width: 80,
//               height: 30,
//               child: ElevatedButton(
//                 onPressed: () {
//                   _loginSubmission.submitForm(
//                       formKey: _form,
//                       username: _name.text,
//                       password: _password.text,
//                       accounts: loginside);
//                 },
//                 style: ElevatedButton.styleFrom(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10)),
//                   backgroundColor: const Color(0xFF77B60B),
//                   foregroundColor: const Color(0xFFFFFFFF),
//                 ),
//                 child: const Text(
//                   "LOG IN",
//                   style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/imagesasstes/image_asset_class.dart';
import 'package:haptic_fone/textFormfileds/textformfiledlogin.dart';
import 'package:haptic_fone/login_page/forgotpassword.dart';
import 'package:haptic_fone/login_page/login_logic.dart';
import 'package:haptic_fone/login_page/login_submission.dart';
import 'package:haptic_fone/login_page/login_validation.dart';
import 'package:haptic_fone/login_page/notification_handler.dart';
import 'package:haptic_fone/login_page/createaccount.dart';
import 'package:hive_flutter/hive_flutter.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late final NotificationHandler _notificationHandler;
  late final LoginLogic _logic;
  late final LoginSubmission _loginSubmission;
  final _form = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _password = TextEditingController();
  List<CreateAccount> loginside = [];

  void fetchloginside() {
    final box = Hive.box<CreateAccount>("Create_Account");
    setState(() {
      loginside = box.values.toList();
    });
  }

  @override
  void initState() {
    super.initState();
    fetchloginside();
    _notificationHandler = NotificationHandler();
    _notificationHandler.initializeService();
    final box = Hive.box<CreateAccount>("Create_Account");
    _logic = LoginLogic(box.values.toList());
    _loginSubmission = LoginSubmission(
        context: context,
        logic: _logic,
        notificationHandler: _notificationHandler);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: _form,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Image.asset(
                          ImgaeAssetClass.hapticloginimg,
                          width: 90,
                          height: 100,
                        ),
                        const SizedBox(height: 20),
                        TextformLoignPage(
                          controllrt: _name,
                          label: "User Name",
                          obsursetext: false,
                          validator: validateusername,
                        ),
                        const SizedBox(height: 10),
                        TextformLoignPage(
                          controllrt: _password,
                          label: "Password",
                          obsursetext: true,
                          validator: validatepassword,
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Forgotpawsswordui(
                                          onaddacount: (p0) {},
                                        )));
                              },
                              child: const Text(
                                "Forgot Account?",
                                style: TextStyle(color: Color(0xFF77B60B)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CreateaccountUi(
                                          onaddacount: (p0) {},
                                        )));
                              },
                              child: const Text(
                                "Create Account?",
                                style: TextStyle(color: Color(0xFF77B60B)),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              _loginSubmission.submitForm(
                                formKey: _form,
                                username: _name.text,
                                password: _password.text,
                                accounts: loginside,
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              backgroundColor: const Color(0xFF77B60B),
                              foregroundColor: Colors.white,
                            ),
                            child: const Text(
                              "LOG IN",
                              style: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
