import 'package:flutter/material.dart';
import 'buttonlogin.dart';
import 'labellogin.dart';

class Body extends StatefulWidget {
  Body({this.size});
  final Size size;

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _userController = TextEditingController();
  final _passController = TextEditingController();
  final _userFocus = FocusNode();
  final _passFocus = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: widget.size.height * 0.35,
      left: widget.size.width * 0.15,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          LabelLogin(),
          Container(
            width: widget.size.width * 0.7,
            child: TextField(
              focusNode: _userFocus,
              textInputAction: TextInputAction.next,
              onSubmitted: (value) {
                _userFocus.unfocus();
                FocusScope.of(context).requestFocus(_passFocus);
              },
              controller: _userController,
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
            width: widget.size.width * 0.7,
            child: TextField(
              focusNode: _passFocus,
              textInputAction: TextInputAction.done,
              onSubmitted: (value) {},
              controller: _passController,
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
          ButtonLogin(
              size: widget.size,
              user: _userController.text,
              pass: _passController.text),
        ],
      ),
    );
  }
}
