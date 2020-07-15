import 'package:flutter/material.dart';
import 'buttonlogin.dart';
import 'labellogin.dart';

String user = '', pass;

class Body extends StatelessWidget {
  Body({this.size});

  final Size size;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: size.height * 0.35,
      left: size.width * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LabelLogin(),
          Container(
            width: size.width * 0.7,
            child: TextField(
              onChanged: (text) {
                user = text;
              },
              obscureText: false,
              autofocus: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.person),
                hintText: 'Tài khoản',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: size.width * 0.7,
            child: TextField(
              onChanged: (text) {
                pass = text;
              },
              obscureText: true,
              autofocus: false,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.lock),
                hintText: 'Mật khẩu',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                ),
              ),
            ),
          ),
          ButtonLogin(size: size, user: user, pass: pass),
        ],
      ),
    );
  }
}
