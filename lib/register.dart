import 'package:flutter/material.dart';

//kayıt ol sayfası
class Register extends StatelessWidget {
  static String routeName = '/routeRegisterPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green,
      appBar: AppBar(title: Text('Register Page')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('register ekranı'),
            RaisedButton(
                child: Text('Geri Dön'),
                onPressed: () {
                  Navigator.pop(context);
                }),
          ])),
    );
  }
}