import 'package:cool_alert/cool_alert.dart';
import 'package:e_ticaret_flutter_app/Database/auth_service.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/for_text_style.dart';
import 'package:e_ticaret_flutter_app/Dialog/alert_dialog_cool.dart';

import 'package:e_ticaret_flutter_app/View/login_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../DesignStyle/colors_cons.dart';

class RegisterPage extends StatefulWidget {

  static String routeName = '/routeRegisterPage';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {


  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _passwordController=TextEditingController();
  final TextEditingController _nameSurnameController=TextEditingController();





  AuthService _authService=AuthService();

  @override
  Widget build(BuildContext context) {


    final nameSurname = TextField(
        controller: _nameSurnameController,
        obscureText: false,
        cursorColor: text,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(
          fontSize: 18,
          color: text,
        ),
        decoration: InputDecoration(
          hintText: "Adınızı ve Soyadınızı Giriniz",
          hintStyle: TextStyle(color: textDarkHint),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: text),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: text),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: text),
          ),
        )
    );
    final email = TextField(
      controller: _emailController,
        obscureText: false,
        cursorColor: text,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(
          fontSize: 18,
          color: text,
        ),
        decoration: InputDecoration(
          hintText: "Example@mail.com",
          hintStyle: TextStyle(color: textDarkHint),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: text),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: text),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: text),
          ),
        )
    );
    final password = TextField(
      controller: _passwordController,
        obscureText: true,
        cursorColor: text,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(
          fontSize: 18,
          color: text,
        ),
        decoration: InputDecoration(
          hintText: "Parolanızı Giriniz",
          hintStyle: TextStyle(color: textDarkHint),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: text),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: text),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: text),
          ),
        )
    );
    final registerButton = Material(
      borderRadius: BorderRadius.circular(1.0),
      color: background,
      child: FlatButton(
        shape: RoundedRectangleBorder(side: BorderSide(color: text)),
        minWidth: 50,
        child: Text(
          "HESAP OLUŞTUR",
          textAlign: TextAlign.center,
          style: TextStyle(color: text, fontWeight: FontWeight.bold),
        ),
        onPressed: () {
          setState(() {
            if(_emailController.text.toString().isNotEmpty && _nameSurnameController.text.toString().isNotEmpty && _passwordController.text.toString().isNotEmpty){
              SuccessAlertRegister(context);
              _authService.createPerson(_emailController.text,_nameSurnameController.text,_passwordController.text);
              //
            }
            else{
              ErorrAlertRegister(context);
            }
          });

          }

      ),
    );
    final goLoginButton = TextButton(
      style: ButtonStyle(),
      onPressed: () {
        Navigator.pushNamed(context, LoginPage.routeName);
      },
      child: Text(
        "Hesabım var Giriş yapmak için dokun.",
        style: TextStyle(color: text),
      ),
    );


    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: themeColor,
      body: Container(
        child: Expanded(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Center(
                  child: CircleAvatar(
                    radius: 100,
                    backgroundColor: const Color(0XFF),
                    backgroundImage: AssetImage("images/Logo.png"),
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "KAYIT OL",
                  style: TextStyle(
                    color: text,
                    fontSize: 42,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  "Adı Soyadı",
                  style: TextStyle(
                    color: text,
                    fontSize: 14,
                  ),
                ),
                nameSurname,
                SizedBox(height: 10),
                Text(
                  "E-posta",
                  style: TextStyle(
                    color: text,
                    fontSize: 14,
                  ),
                ),
                email,
                SizedBox(height: 10),
                Text(
                  "Şifre",
                  style: TextStyle(
                    color: text,
                    fontSize: 14,
                  ),
                ),
                password,
                SizedBox(height: 10),
                Center(child: registerButton),
                SizedBox(height: 10),
                Center(child: goLoginButton),
              ],
            ),
          ),
        ),
        decoration: new BoxDecoration(
            color: background,
            borderRadius: new BorderRadius.only(
                bottomRight: const Radius.circular(180))),
      ),
    );
  }
}


