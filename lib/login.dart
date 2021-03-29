import 'package:flutter/material.dart';


//login sayfasi
class Login extends StatelessWidget {
  static String routeName = '/routeLoginPage';

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.pink,
      appBar: AppBar(title: Text('Login Page')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('login ekranı'),
            RaisedButton(
                child: Text('Geri Dön'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ])),
    );
  }
}