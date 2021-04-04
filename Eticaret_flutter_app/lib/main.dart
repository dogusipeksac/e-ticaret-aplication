import 'package:e_ticaret_flutter_app/View/ad_detail_page.dart';
import 'package:e_ticaret_flutter_app/View/product_share_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'View/home_page.dart';
import 'View/my_product_page.dart';
import 'View/register_page.dart';
import 'View/login_page.dart';
import 'View/notifications_page.dart';
import 'View/message_list_page.dart';
import 'View/setting_page.dart';
import 'View/filter_page.dart';


void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    runApp(MyApp());
}

class MyApp extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(accentColor: Colors.grey),
        initialRoute: HomePage.routeName,
        routes: {
          HomePage.routeName: (context) => HomePage(),
          LoginPage.routeName: (context) => LoginPage(),
          RegisterPage.routeName: (context) => RegisterPage(),
          Notifications.routeName: (context) => Notifications(),
          MessageList.routeName:(context)=>MessageList(),
          Setting.routeName:(context)=>Setting(),
          MyProduct.routeName:(context)=>MyProduct(),
          FilterPage.routeName:(context)=>FilterPage(),
          ProductSharePage.routeName:(context)=>ProductSharePage(),
          AdDetail.routeName:(context)=>AdDetail(),
        });
  }
}











