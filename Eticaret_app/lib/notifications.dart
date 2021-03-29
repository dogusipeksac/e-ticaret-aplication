import 'package:flutter/material.dart';


//bildirimler sayfasi
class Notifications extends StatelessWidget {
  static String routeName = '/routeNotificationPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Notification Page')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('Notification ekranı'),
            Text('newwww'),
            Text('yenii')
          ])),
    );
  }
}