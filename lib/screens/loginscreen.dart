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
              child: Image.asset('assets/images/login_top.png'),
            ),
            Positioned(
              top: size.height * 0.35,
              left: size.width * 0.15,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 30),
                    child: Text(
                      'Đăng nhập',
                      style: TextStyle(
                          color: Colors.black54,
                          fontSize: 25,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: size.width * 0.7,
                    child: TextField(
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
                        )),
                  ),
                  Container(
                    decoration: BoxDecoration(boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 20,
                        offset: Offset(10, 10), // changes position of shadow
                      ),
                    ]),
                    margin: EdgeInsets.symmetric(vertical: 20),
                    width: size.width * 0.5,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      child: FlatButton(
                        padding:
                            EdgeInsets.symmetric(vertical: 17, horizontal: 40),
                        color: Colors.blueAccent,
                        onPressed: () {},
                        child: Text(
                          'Đăng nhập',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Image.asset(
                'assets/images/login_bottom.png',
                alignment: Alignment.bottomLeft,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
