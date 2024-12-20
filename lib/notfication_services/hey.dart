import 'package:flutter/material.dart';
import 'package:haptic_fone/login_page/notification_serivces.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Create an instance of NotificationService
  final NotificationService _notificationService = NotificationService();

  @override
  void initState() {
    super.initState();
    _notificationService.initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Local Notifications"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _notificationService.showNotification("Out Of Stock", "Model");
          },
          child: Text("Show Notification"),
        ),
      ),
    );
  }
}
