import 'package:e_ticaret_flutter_app/login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'color_cons.dart';

//kayıt ol sayfası
class Register extends StatelessWidget {

  static String routeName = '/routeRegisterPage';
  @override
  Widget build(BuildContext context) {
    final nameSurname = TextField(
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
        onPressed: () {Navigator.pushNamed(context, Login.routeName);},
      ),
    );
    final goLoginButton = TextButton(
      style: ButtonStyle(),
      onPressed: () {
        Navigator.pushNamed(context, Login.routeName);
      },
      child: Text(
        "Hesabım var Giriş yapmak için dokun.",
        style: TextStyle(color: text),
      ),
    );

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                SizedBox(height: 40),
                Text(
                  "KAYIT OL",
                  style: TextStyle(
                    color: text,
                    fontSize: 42,
                  ),
                ),
                SizedBox(height: 30),
                Text(
                  "Adı Soyadı",
                  style: TextStyle(
                    color: text,
                    fontSize: 14,
                  ),
                ),
                nameSurname,
                SizedBox(height: 30),
                Text(
                  "E-posta",
                  style: TextStyle(
                    color: text,
                    fontSize: 14,
                  ),
                ),
                email,
                SizedBox(height: 30),
                Text(
                  "Şifre",
                  style: TextStyle(
                    color: text,
                    fontSize: 14,
                  ),
                ),
                password,
                SizedBox(height: 30),
                Center(child: registerButton),
                SizedBox(height: 30),
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
