import 'package:TluSchedule/Models/Info.dart';
import 'package:TluSchedule/Models/Schedule.dart';
import 'package:TluSchedule/Screens/HomeScreen/homescreen.dart';
import 'package:flutter/material.dart';
import 'package:TluSchedule/Services/login.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ButtonLogin extends StatelessWidget {
  const ButtonLogin({
    Key key,
    @required this.size,
    @required this.user,
    @required this.pass,
  }) : super(key: key);

  final Size size;
  final String user;
  final String pass;

  Future<bool> login(BuildContext context, String user, String pass) async {
    Login login = Login(msv: user, pass: pass);
    if (await login.getStatus() == '1') {
      List<Schedule> schedules = await login.getShedule();
      Info info = login.getInfo();
      SharedPreferences preferences = await SharedPreferences.getInstance();
      preferences.setString(
          'encode',
          Schedule.encodeSchedules(schedules) +
              'split' +
              Info.encodeInfo(info));
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomeScreen(
            schedule: schedules,
            info: info,
          ),
        ),
      );
      return true;
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.blueGrey.withOpacity(0.2),
          spreadRadius: 5,
          blurRadius: 20,
          offset: Offset(10, 10),
        ),
      ]),
      margin: EdgeInsets.symmetric(vertical: 20),
      width: size.width * 0.5,
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        child: FlatButton(
          padding: EdgeInsets.symmetric(vertical: 17, horizontal: 40),
          color: Colors.blueAccent,
          onPressed: () async {
            if (user.isEmpty || pass.isEmpty) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Lỗi'),
                      content: Text(
                        'Hãy nhập đủ thông tin',
                      ),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: Text('OK'))
                      ],
                    );
                  });
            } else if (await login(context, user, pass) == false) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Lỗi'),
                      content: Text(
                        'Sai tên tài khoản mật khẩu',
                      ),
                      actions: <Widget>[
                        FlatButton(
                            onPressed: () => Navigator.pop(context, true),
                            child: Text('OK'))
                      ],
                    );
                  });
            }
          },
          child: Text(
            'Đăng nhập',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
