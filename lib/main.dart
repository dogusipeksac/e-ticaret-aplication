import 'package:flutter/material.dart';
import 'register.dart';
import 'login.dart';
import 'notifications.dart';
import 'message_list.dart';
import 'my_product.dart';
import 'ad_detail.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(accentColor: Colors.grey),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          Login.routeName: (context) => Login(),
          Register.routeName: (context) => Register(),
          Notifications.routeName: (context) => Notifications(),
          MessageList.routeName:(context)=>MessageList(),

        });
  }
}
//anasayfa
class HomePage extends StatelessWidget {

  static String routeName = '/';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow,
      appBar: AppBar(title: Text('Sayfalar Arası Geçiş / Navigation')),
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
                }),
            RaisedButton(
                child: Text('Git -> Notification'),
                onPressed: () {
                  Navigator.pushNamed(context, Notifications.routeName);
                }),



          ])),
    );
  }
}










