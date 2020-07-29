import 'package:TluSchedule/Components/cardschedule.dart';
import 'package:TluSchedule/Models/Schedule.dart';
import 'package:TluSchedule/Screens/HomeScreen/Components/background.dart';
import 'package:TluSchedule/Screens/HomeScreen/homescreen.dart';
import 'package:TluSchedule/Utilities/GetSchedule.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ScheduleWeek extends StatelessWidget {
  ScheduleWeek({this.widget});
  final HomeScreen widget;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    GetSchedule get = GetSchedule(list: widget.schedule);
    get.getScheduleweek();
    final List<DateTime> listdate = get.listdate;
    final List<List<Schedule>> listschedule = get.listschedule;
    return Stack(
      children: <Widget>[
        BackGround(widget: widget),
        Positioned(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 90,
              ),
              Text(
                'Lịch học tất cả',
                style: TextStyle(
                    color: Colors.blueGrey,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
              listdate.isEmpty
                  ? Expanded(
                      child: Center(child: Text('Không có lịch học')),
                    )
                  : Expanded(
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemBuilder: (context, i) => Padding(
                          padding: const EdgeInsets.only(bottom: 35),
                          child: Column(
                            children: <Widget>[
                              Padding(
                                padding: const EdgeInsets.only(bottom: 5),
                                child: Text(
                                  'Thứ ' +
                                      (listdate[i].weekday + 1).toString() +
                                      ', Ngày ' +
                                      DateFormat('dd/MM/yyyy')
                                          .format(listdate[i])
                                          .toString(),
                                  style: TextStyle(
                                      color: Colors.blueGrey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                              ListView.builder(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (context, j) => CardSchedule(
                                  size: size,
                                  schedule: listschedule[i][j],
                                ),
                                itemCount: listschedule[i].length,
                              ),
                            ],
                          ),
                        ),
                        itemCount: listdate.length,
                      ),
                    ),
            ],
          ),
        ),
      ],
    );
  }
}
