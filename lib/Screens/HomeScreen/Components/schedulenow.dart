import 'package:TluSchedule/Components/cardschedule.dart';
import 'package:TluSchedule/Models/Schedule.dart';
import 'package:TluSchedule/Screens/HomeScreen/Components/background.dart';
import 'package:TluSchedule/Screens/HomeScreen/homescreen.dart';
import 'package:TluSchedule/Utilities/GetSchedule.dart';
import 'package:flutter/material.dart';

class ScheduleNow extends StatelessWidget {
  ScheduleNow({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final HomeScreen widget;

  @override
  Widget build(BuildContext context) {
    List<Schedule> scheduletoday;
    Size size = MediaQuery.of(context).size;
    scheduletoday =
        GetSchedule(list: widget.schedule).getScheduleInDay(DateTime.now());
    return Container(
      width: double.infinity,
      height: size.height,
      child: Stack(
        children: <Widget>[
          BackGround(
            widget: widget,
          ),
          Positioned(
            child: Column(
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
                Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemBuilder: (context, i) => scheduletoday.isEmpty
                        ? Center(child: Text('Hôm nay bạn nghỉ'))
                        : Center(
                            child: CardSchedule(
                              size: size,
                              schedule: scheduletoday[i],
                            ),
                          ),
                    itemCount: scheduletoday.isEmpty ? 1 : scheduletoday.length,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
