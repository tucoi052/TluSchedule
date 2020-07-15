import 'package:flutter/material.dart';

class LabelLogin extends StatelessWidget {
  const LabelLogin({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
      child: Text(
        'Đăng nhập',
        style: TextStyle(
            color: Colors.black54,
            fontSize: 25,
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}
