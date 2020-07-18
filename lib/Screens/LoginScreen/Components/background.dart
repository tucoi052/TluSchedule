import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(children: <Widget>[
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
    ]);
  }
}
