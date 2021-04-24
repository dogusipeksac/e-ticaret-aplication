import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/for_text_style.dart';
import 'package:e_ticaret_flutter_app/Dialog/alert_dialog_cool.dart';
import 'package:e_ticaret_flutter_app/View/authentication/register/register_page.dart';
import 'package:e_ticaret_flutter_app/View/authentication/service/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../home_page.dart';

class LoginPage extends StatefulWidget {
  static String routeName = '/routeLogin';

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final emailField = loginTextFieldPackage(
        'example@hotmail.com', false, _emailController, Icons.mail);

    final passwordField = loginTextFieldPackage(
        '***********', true, _passwordController, Icons.vpn_key);

    final loginButton = loginButtonDesign(context);
    final goRegisterButton = goRegisterTextButton(context);
    return loginScaffoldBody(
        emailField, passwordField, loginButton, goRegisterButton);
  }

  Scaffold loginScaffoldBody(TextField emailField, TextField passwordField,
      Material loginButton, TextButton goRegisterButton) {
    return Scaffold(
      backgroundColor: background,
      body: Center(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: ListView(
            shrinkWrap: true,
            children: <Widget>[
              Center(
                  child: Image.asset(
                "images/kapak.png",
              )),
              SizedBox(height: 10.0),
              titleText('E-posta'),
              SizedBox(height: 10.0),
              emailField,
              SizedBox(height: 10.0),
              titleText('Şifre'),
              SizedBox(height: 10.0),
              passwordField,
              SizedBox(height: 10.0),
              Center(child: loginButton),
              SizedBox(height: 10.0),
              Center(child: goRegisterButton),
            ],
          ),
          decoration: new BoxDecoration(
              color: background,
              borderRadius: new BorderRadius.only(
                  bottomRight: const Radius.circular(180))),
        ),
      ),
    );
  }

  TextButton goRegisterTextButton(BuildContext context) {
    return TextButton(
      style: ButtonStyle(),
      onPressed: () {
        Navigator.pushNamed(context, RegisterPage.routeName);
      },
      child: Text(
        "Hesap oluşturak için tıklayın.",
        style: TextStyle(color: text),
      ),
    );
  }

  Material loginButtonDesign(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(1.0),
      color: background,
      // ignore: deprecated_member_use
      child: FlatButton(
        shape: RoundedRectangleBorder(side: BorderSide(color: text)),
        minWidth: 10,
        child: Text(
          "GİRİŞ YAP",
          textAlign: TextAlign.center,
          style: TextStyle(color: text, fontWeight: FontWeight.bold),
        ),
        onPressed: () async {
          // dynamic result=await _authService.signInAnon();
          if (_emailController.text.toString().isNotEmpty &&
              _passwordController.text.toString().isNotEmpty) {
            _authService
                .signIn(_emailController.text, _passwordController.text)
            .then((value) => Navigator.pushNamed(context, HomePage.routeName).
            then((value) => SuccessAlertLogin(context)));
          }
          else{
            ErorrAlertLogin(context);
          }

          /*  setState(() {
          if (_emailController.text.toString().isNotEmpty &&
              _passwordController.text.toString().isNotEmpty) {
            _authService
                .signIn(_emailController.text, _passwordController.text)
                .then((value) =>

          } else {
            ErorrAlertLogin(context);
          }
        });*/
        },
      ),
    );
  }

  TextField loginTextFieldPackage(String hintText, bool obscureText,
      TextEditingController controller, IconData icon) {
    return TextField(
      controller: controller,
      style: TextStyle(
        color: Colors.white,
        decorationColor: Colors.white,
      ),
      cursorColor: Colors.white,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: Icon(
          icon,
          color: Colors.white,
          size: 20,
        ),
        fillColor: Colors.white,
        hintText: hintText,
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  Text titleText(String title) {
    return Text(title, style: inputTexts);
  }
}
