import 'package:flutter/material.dart';

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
          onPressed: () {},
          child: Text(
            'Đăng nhập',
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
