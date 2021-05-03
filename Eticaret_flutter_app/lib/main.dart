import 'package:e_ticaret_flutter_app/View/authentication/auth_widget.dart';
import 'package:e_ticaret_flutter_app/View/authentication/auth_widget_builder.dart';
import 'package:e_ticaret_flutter_app/View/message_detail.dart';
import 'package:e_ticaret_flutter_app/View/product_share_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'View/authentication/login/login_page.dart';
import 'View/authentication/register/register_page.dart';
import 'View/authentication/service/auth_service.dart';
import 'View/authentication/setting/setting_page.dart';
import 'View/home_page.dart';
import 'View/my_product_page.dart';
import 'View/notifications_page.dart';
import 'View/message_list_page.dart';
import 'View/filter_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}
/*
MultiProvider(
providers: [
Provider<AuthService>(
create: (_) => AuthService(FirebaseAuth.instance),
),
StreamProvider(create:(context)=>context.read<AuthService>().
authStateChanges,),
],
),*/

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthService>(create: (_) => AuthService(),)
      ],
      child: AuthWidgetBuilder(builder: (context,userSnapshot) {
        return MaterialApp(
            theme: ThemeData(accentColor: Colors.grey),
            home: AuthWidget(userSnapshot: userSnapshot,),
            routes: {
              HomePage.routeName: (context) => HomePage(),
              LoginPage.routeName: (context) => LoginPage(),
              RegisterPage.routeName: (context) => RegisterPage(),
              Notifications.routeName: (context) => Notifications(),
              MessageList.routeName: (context) => MessageList(),
              SettingPage.routeName: (context) => SettingPage(),
              MyProduct.routeName: (context) => MyProduct(),
              FilterPage.routeName: (context) => FilterPage(),
              ProductSharePage.routeName: (context) => ProductSharePage(),
              MessageDetail.routeName: (context) => MessageDetail(),
            });
        }),
    );
  }
}
