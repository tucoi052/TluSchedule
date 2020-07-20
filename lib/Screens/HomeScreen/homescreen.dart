import 'package:TluSchedule/Models/Info.dart';
import 'package:TluSchedule/Models/Schedule.dart';
import 'package:TluSchedule/Screens/LoginScreen/loginscreen.dart';
import 'package:TluSchedule/Utilities/GetSchedule.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../Components/cardschedule.dart';

class HomeScreen extends StatefulWidget {
  final List<Schedule> schedule;
  final Info info;
  HomeScreen({this.schedule, this.info});
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Schedule> scheduletoday;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    scheduletoday = GetSchedule(list: widget.schedule).getScheduleToday();
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: size.height,
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Image.asset('assets/images/home_top.png'),
            ),
            Positioned(
              right: 10,
              top: 45,
              child: GestureDetector(
                onTap: () async {
                  SharedPreferences preferences =
                      await SharedPreferences.getInstance();
                  preferences.remove('encode');
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Login()));
                },
                child: Text(
                  widget.info.name + '\n' + widget.info.classs,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
            Positioned(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 90,
                  ),
                  Text(
                    'Lịch học hôm nay',
                    style: TextStyle(
                        color: Colors.blueGrey,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    itemBuilder: (context, i) => Center(
                      child: CardSchedule(
                        size: size,
                        schedule: scheduletoday[i],
                      ),
                    ),
                    itemCount: scheduletoday.length,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
