import 'package:flutter/material.dart';
import 'home_page.dart';
import 'my_product.dart';
import 'register.dart';
import 'login.dart';
import 'notifications.dart';
import 'message_list.dart';
import 'setting.dart';
import 'filter.dart';


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
          Setting.routeName:(context)=>Setting(),
          MyProduct.routeName:(context)=>MyProduct(),
          Filter.routeName:(context)=>Filter(),
        });
  }
}











