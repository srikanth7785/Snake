import 'package:flutter/material.dart';
// import 'package:snake/temp.dart';
import 'home.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Cupertino Snake🐍",
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Cupertino Snake🐍",
//       home: VariousDiscs(50),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }
