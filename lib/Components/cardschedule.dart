import 'package:TluSchedule/Models/Schedule.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class CardSchedule extends StatelessWidget {
  const CardSchedule({
    Key key,
    @required this.size,
    this.schedule,
  }) : super(key: key);

  final Size size;
  final Schedule schedule;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        elevation: 6,
        shadowColor: Colors.blueGrey,
        child: InkWell(
          splashColor: Colors.blue.withAlpha(50),
          onTap: () {
            print(schedule.subjects);
          },
          child: Container(
            width: size.width * 0.9,
            height: 90,
            child: Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    'Tiết: ' + schedule.time,
                    style:
                        TextStyle(fontSize: 16, color: Colors.blueAccent[400]),
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      width: size.width * 0.55,
                      child: AutoSizeText(
                        schedule.subjects,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                        maxLines: 2,
                      ),
                    ),
                    SizedBox(
                      height: 2,
                    ),
                    Row(
                      children: <Widget>[
                        Icon(
                          Icons.location_on,
                          color: Colors.redAccent,
                        ),
                        Text(schedule.room)
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
