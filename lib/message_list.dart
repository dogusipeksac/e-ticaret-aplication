import 'package:flutter/material.dart';

//mesajların listesinin sayfası
class MessageList extends StatelessWidget {
  static String routeName = '/routeMessagePage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(title: Text('Message Page')),
      body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Text('message list sayfası'),
          ])),
    );
  }
}