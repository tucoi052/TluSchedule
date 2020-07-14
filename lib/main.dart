import 'package:TluSchedule/screens/loginscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(Main());
}

class Main extends StatefulWidget {
  @override
  _MainState createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TLU Schedule',
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}
