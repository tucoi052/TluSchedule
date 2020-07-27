import 'package:TluSchedule/Models/Schedule.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Models/Info.dart';
import 'Screens/HomeScreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'Screens/LoginScreen/loginscreen.dart';

void main() {
  runApp(Phoenix(child: Main()));
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
      theme: ThemeData.light(),
      home: FutureBuilder(
          future: checkSchedules(),
          builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
            if (snapshot.hasData) {
              return snapshot.data
                  ? HomeScreen(
                      info: info,
                      schedule: list,
                    )
                  : Login();
            }
            return Scaffold(
              body: SpinKitCircle(
                color: Colors.blueAccent,
                size: 50,
              ),
            );
          }),
    );
  }
}

List<Schedule> list;
Info info;
bool check;
Future<bool> checkSchedules() async {
  SharedPreferences preferences = await SharedPreferences.getInstance();
  String encode = preferences.getString('encode') ?? '';
  if (encode.isNotEmpty) {
    list = Schedule.decodeSchedules(encode.split('split')[0]);
    info = Info.decodeInfo(encode.split('split')[1]);
    return true;
  }
  return false;
}
