import 'Components/body.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        height: size.height,
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Positioned(
              top: 0,
              child: Image.asset('assets/images/login_top.png'),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/login_bottom.png',
                alignment: Alignment.bottomLeft,
              ),
            ),
            Body(size: size),
          ],
        ),
      ),
    );
  }
}
