import 'package:e_ticaret_flutter_app/Database/auth.dart';
import 'package:e_ticaret_flutter_app/Dialog/alert_dialog_cool.dart';
import 'package:e_ticaret_flutter_app/View/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'register_page.dart';
import '../DesignStyle/colors_cons.dart';


class LoginPage extends StatefulWidget {

  static String routeName = '/routeLogin';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  AuthService _authService=AuthService();

  @override
  Widget build(BuildContext context) {
    final emailField = TextField(
controller: _emailController,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      obscureText: false,
      decoration: InputDecoration(
        hintText: 'example@hotmail.com',
        hintStyle: TextStyle(color: Colors.white),
      ),
    );

    final passwordField = TextField(
      controller: _passwordController,
      style: TextStyle(
        color: Colors.white,
        decorationColor: Colors.white,
      ),
      cursorColor: Colors.white,
      obscureText: true,
      decoration: InputDecoration(
        fillColor: Colors.white,
        hintText: '**************',
        hintStyle: TextStyle(color: Colors.white),
      ),
    );


    final loginButton = Material(
      borderRadius: BorderRadius.circular(1.0),
      color: background,
      child: FlatButton(
        shape: RoundedRectangleBorder(side: BorderSide(color: text)),
        minWidth: 10,
        child: Text(
          "GİRİŞ YAP",
          textAlign: TextAlign.center,
          style: TextStyle(color: text, fontWeight: FontWeight.bold),
        ),
        onPressed: () {

          setState(() {
            if(_emailController.text.toString().isNotEmpty && _passwordController.text.toString().isNotEmpty){
              _authService.signIn(_emailController.text,_passwordController.text)
                  .then((value) =>  Navigator.pushNamed(context, HomePage.routeName));

            }
            else{
              ErorrAlertLogin(context);
            }
          });

         },
      ),
    );
    final goRegisterButton = TextButton(
      style: ButtonStyle(),
      onPressed: () {
        Navigator.pushNamed(context, RegisterPage.routeName);
      },
      child: Text(
        "Hesap oluşturak için tıklayın.",
        style: TextStyle(color: text),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: themeColor,
      body:Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                    child: Image.asset(
                      "images/kapak.png",
                    )),
                SizedBox(height: 10.0),
                Text('Email',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 10.0),
                emailField,
                SizedBox(height: 10.0),
                Text('Şifre',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 10.0),
                passwordField,
                SizedBox(height: 15.0),
                Center(child: loginButton),
                SizedBox(height: 15.0),
                Center(
                    child: goRegisterButton),
              ],
            ),
          ),
          decoration: new BoxDecoration(
              color: background,
              borderRadius:
              new BorderRadius.only(bottomRight: const Radius.circular(180))),
        ),
      ),
    );
  }
}

