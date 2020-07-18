import 'package:flutter/material.dart';
import 'package:TluSchedule/Services/login.dart';

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
            Login login = Login(msv: user, pass: pass);
            String statuscode = await login.getStatus();
            if (statuscode == '1') {
              print('Đăng nhập thành công');
              login.getShedule();
            } else if (statuscode == '0') {
              print('Sai tên tài khoản mật khẩu');
            } else
              print('error');
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
