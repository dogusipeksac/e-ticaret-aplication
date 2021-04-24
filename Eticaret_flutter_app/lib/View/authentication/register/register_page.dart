import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:e_ticaret_flutter_app/Dialog/alert_dialog_cool.dart';
import 'package:e_ticaret_flutter_app/View/authentication/login/login_page.dart';
import 'package:e_ticaret_flutter_app/View/authentication/service/auth_service.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  static String routeName = '/routeRegisterPage';
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameSurnameController = TextEditingController();
  final darkGrey = background;

  AuthService _authService = AuthService();

  @override
  Widget build(BuildContext context) {
    final nameSurname = registerTextFieldPackage(
        _nameSurnameController, "Adınızı ve Soyadınızı Giriniz", false,Icons.person_rounded);
    final email =
        registerTextFieldPackage(_emailController, "E-Mail Giriniz", false,Icons.mail);
    final password =
        registerTextFieldPackage(_passwordController, "Şifre Giriniz.", true,Icons.vpn_key);
    final registerButton = registerButtonDesing();
    final goLoginButton = goLoginTextButton(context);

    return registerScaffoldBody(
        nameSurname,
        email,
        password,
        registerButton,
        goLoginButton);
  }

  Scaffold registerScaffoldBody(TextField nameSurname,
      TextField email,
      TextField password,
      Material registerButton,
      TextButton goLoginButton) {
    return Scaffold(
      backgroundColor: themeColor,
    body: SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(15),
        child: Expanded(
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
              registerTitleText('KAYIT OL',42),
              SizedBox(height: 10),
              registerTitleText("Adı Soyadı",14),
              nameSurname,
              SizedBox(height: 10),
             registerTitleText("E-posta",14),
              email,
              SizedBox(height: 10),
              registerTitleText("Şifre",14),
              password,
              SizedBox(height: 10),
              Center(child: registerButton),
              SizedBox(height: 10),
              Center(child: goLoginButton),
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

  Text registerTitleText(String title,double fontsize) {
    return Text(
            title,
            style: TextStyle(
              color: text,
              fontSize: fontsize,
            ),
          );
  }

  Material registerButtonDesing() {
    return Material(
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
        onPressed: () async {
          if(_emailController.text.toString().isNotEmpty &&
              _nameSurnameController.text.toString().isNotEmpty &&
              _passwordController.text.toString().isNotEmpty){
            SuccessAlertRegister(context);
            _authService.createPerson(_emailController.text,
                _nameSurnameController.text,_passwordController.text);

          }else{
            ErorrAlertRegister(context);
          }

          /*   setState(() {
          if(_emailController.text.toString().isNotEmpty && _nameSurnameController.text.toString().isNotEmpty && _passwordController.text.toString().isNotEmpty){
            SuccessAlertRegister(context);
            _authService.createPerson(_emailController.text,
            _nameSurnameController.text,_passwordController.text);
            //
          }
          else{
            ErorrAlertRegister(context);
          }
        });*/
        }),
  );
  }

  TextButton goLoginTextButton(BuildContext context) {
    return TextButton(
      style: ButtonStyle(),
      onPressed: () {
        Navigator.pushNamed(context, LoginPage.routeName);
      },
      child: Text(
        "Hesabım var Giriş yapmak için dokun.",
        style: TextStyle(color: text),
      ),
    );
  }

  TextField registerTextFieldPackage(
      TextEditingController controller, String hintText, obscureText,IconData icon) {
    return TextField(
        controller: controller,
        obscureText: obscureText,
        cursorColor: text,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(
          fontSize: 18,
          color: text,
        ),
        decoration: InputDecoration(
          prefixIcon: Icon(icon,color: Colors.white,size: 20,),
          hintText: hintText,
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
        ));
  }
}
