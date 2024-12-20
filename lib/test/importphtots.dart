// import 'package:flutter/material.dart';
// import 'package:hapticfone_stock/test/addingstudy.dart';

// void main() {
//   runApp(Ready());
// }

// class Ready extends StatelessWidget {
//   Ready({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [TextField()],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';

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
  // TextEditingController create cheyyunnu
  TextEditingController textcon = TextEditingController();
  bool cardhiden = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Studying"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          TextField(
            controller: textcon,
            onChanged: (value) {
              cardhiden = value.isNotEmpty;
            },
            decoration: InputDecoration(label: Text("what is this")),
          ),
          ElevatedButton(
              onPressed: () {
                setState(() {});
              },
              child: Text("Ok")),
          Visibility(
            visible: cardhiden,
            child: Card(
              child: Row(
                children: [Text("${textcon.text}")],
              ),
            ),
          )
        ],
      ),
    );
  }
}
