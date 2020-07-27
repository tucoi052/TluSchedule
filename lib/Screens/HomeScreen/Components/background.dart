import 'package:TluSchedule/Screens/HomeScreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BackGround extends StatelessWidget {
  BackGround({@required this.widget});
  final HomeScreen widget;
  @override
  Widget build(BuildContext context) {
    return Stack(
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
              Phoenix.rebirth(context);
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
      ],
    );
  }
}
