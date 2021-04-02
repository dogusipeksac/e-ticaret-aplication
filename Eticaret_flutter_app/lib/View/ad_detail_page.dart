import 'package:flutter/material.dart';


//ilan detay sayfası
class AdDetail extends StatelessWidget {
  static String routeName = '/routeAdDetailPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Ad Detail Page')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('ilanların detayı sayfası'),
          ])),
    );
  }
}