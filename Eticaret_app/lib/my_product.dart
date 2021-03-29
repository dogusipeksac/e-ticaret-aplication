import 'package:flutter/material.dart';

//ürünlerim listesinin sayfası
class MyProduct extends StatelessWidget {
  static String routeName = '/routeMessagePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Ürünlerim')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('ürünlerimin listesi sayfası'),

          ])),
    );
  }
}