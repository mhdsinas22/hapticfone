import 'package:flutter/material.dart';
import 'package:haptic_fone/database/db_stockitems.dart';
import 'package:haptic_fone/screens/HOME/bottomuser.dart';
import 'notification_handler.dart';
import 'login_logic.dart';

class LoginSubmission {
  final BuildContext context;
  final LoginLogic logic;
  final NotificationHandler notificationHandler;

  LoginSubmission({
    required this.context,
    required this.logic,
    required this.notificationHandler,
  });

  void submitForm({
    required GlobalKey<FormState> formKey,
    required String username,
    required String password,
    required List<CreateAccount> accounts,
  }) {
    if (!(formKey.currentState?.validate() ?? false)) return;

    final trimmedUsername = username.trim();
    final trimmedPassword = password.trim();

    if (accounts.isEmpty) {
      // No accounts exist in Hive
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("No accounts found. Please create an account."),
        ),
      );
      return;
    }

    final account = logic.validatelogin(trimmedUsername, trimmedPassword);

    if (account != null) {
      // Show notification for low stock
      notificationHandler.checklowstock();

      // Navigate to the home page
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => const Bottomuser(
            selecteddindex: 0,
          ),
        ),
      );
    } else {
      // If account does not exist or credentials are incorrect
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Incorrect username or password")),
      );
    }
  }
}
