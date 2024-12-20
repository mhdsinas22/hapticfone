import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/screens/HOME/bottomuser.dart';

class LoginLogic {
  final List<CreateAccount> loginstore;
  LoginLogic(this.loginstore);
  CreateAccount? validatelogin(String username, String password) {
    try {
      return loginstore.firstWhere(
          (item) => item.USername == username && item.password == password);
    } catch (e) {
      return null;
    }
  }

  void navigatethehomepage(BuildContext context) {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (context) => Bottomuser(selecteddindex: 0)));
  }
}
