import 'package:flutter/material.dart';

import 'colors_cons.dart';

class Login extends StatelessWidget {
  static String routeName = '/routeLogin';
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: themeColor, body: LoginPage(),resizeToAvoidBottomInset: false,);
  }
}

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LoginHome(context);
  }
}

Widget LoginHome(BuildContext context) {
  final emailField = TextField(
    style: TextStyle(color: Colors.white),
    cursorColor: Colors.white,
    obscureText: false,
    decoration: InputDecoration(
      hintText: 'example@hotmail.com',
      hintStyle: TextStyle(color: Colors.white),
    ),
  );

  final passwordField = TextField(
    style: TextStyle(
      color: Colors.white,
      decorationColor: Colors.white,
    ),
    cursorColor: Colors.white,
    obscureText: true,
    decoration: InputDecoration(
      fillColor: Colors.white,
      hintText: '**************',
      hintStyle: TextStyle(color: Colors.white),
    ),
  );

  final loginButton = Material(
    elevation: 8.0,

    borderRadius: BorderRadius.circular(1.0),
    color: background,
    // ignore: deprecated_member_use
    child: FlatButton(
      minWidth: 50,
      onPressed: () {},
      child: Text("GİRİŞ YAP",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );

  return Center(
    child: Container(
      child: Padding(
        padding: EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
                child: Image.asset(
              "images/kapak.png",
            )),
            SizedBox(height: 10.0),
            Text('Email',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: acikBeyaz)),
            SizedBox(height: 10.0),
            emailField,
            SizedBox(height: 10.0),
            Text('Şifre',
                style:
                    TextStyle(fontWeight: FontWeight.bold, color: acikBeyaz)),
            SizedBox(height: 10.0),
            passwordField,
            SizedBox(height: 15.0),
            Center(child: loginButton),
            SizedBox(height: 15.0),
            Center(
                child: Text('Hesabınızı unuttunuzmu?',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: acikBeyaz))),
          ],
        ),
      ),
      decoration: new BoxDecoration(
          color: background,
          borderRadius:
              new BorderRadius.only(bottomRight: const Radius.circular(180))),
    ),
  );
}
