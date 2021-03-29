import 'package:flutter/material.dart';

//Ayarlar sayfası
class Setting extends StatelessWidget {
  static String routeName = '/routeSetting';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Ayarlar')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('message list sayfası'),
          ])),
    );
  }
}