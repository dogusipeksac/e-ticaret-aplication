import 'package:flutter/material.dart';

import 'filter.dart';
import 'login.dart';
import 'main_drawer.dart';
import 'register.dart';


//anasayfa
class HomePage extends StatelessWidget {

  static String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Sayfalar Arası Geçiş / Navigation')),
      drawer: MainDrawer(),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('HomePage'),
            RaisedButton(
                child: Text('Git -> Login'),
                onPressed: () {
                  Navigator.pushNamed(context, Login.routeName);
                }), RaisedButton(
                child: Text('Git -> Register'),
                onPressed: () {
                  Navigator.pushNamed(context, Register.routeName);
                }),RaisedButton(
                child: Text('Git -> Filter'),
                onPressed: () {
                  Navigator.pushNamed(context, Filter.routeName);
                }),




          ])),
    );
  }
}