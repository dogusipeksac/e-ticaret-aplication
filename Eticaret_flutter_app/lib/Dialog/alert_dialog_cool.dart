

import 'package:cool_alert/cool_alert.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:e_ticaret_flutter_app/View/authentication/login/login_page.dart';

import 'package:flutter/material.dart';



 void SuccessAlertRegister(BuildContext context){
   CoolAlert.show(
     context: context,
     type: CoolAlertType.success,
     text: "Kayıt başarılı!",
     title: 'Harika.',
     confirmBtnText: 'Giriş için tıkla!',
      onConfirmBtnTap: () => Navigator.pushNamed(context, LoginPage.routeName),
     backgroundColor: background,
     confirmBtnColor: background,
   );
}


void ErorrAlertRegister(BuildContext context){
  CoolAlert.show(
    context: context,
    type: CoolAlertType.error,
    title: 'Ups...',
    text: "Kayıt başarısız eksiklerinizi doldurun!",
    confirmBtnText: 'Tamam',
    backgroundColor: background,
    confirmBtnColor: background,
  );
}


void ErorrAlertLogin(BuildContext context){
  CoolAlert.show(
    context: context,
    type: CoolAlertType.error,
    title: 'Giriş başarısız!',
    text: "Eksit veya yanlış girdiniz!",
    confirmBtnText: 'Tamam',
    backgroundColor: background,
    confirmBtnColor: background,
  );
}

void LoadingAlertLogin(BuildContext context){
  CoolAlert.show(
    context: context,
    type: CoolAlertType.loading,
    text: "Loading!",
    backgroundColor: background,
    confirmBtnColor: background,
  );

}

void SuccessAlertLogin(BuildContext context){
  CoolAlert.show(
    context: context,
    type: CoolAlertType.success,
    text: "Giriş başarılı!",
    title: 'Harika.',
    confirmBtnText: 'Anasayfaya Dön!',
    backgroundColor: background,
    confirmBtnColor: background,
  );

}








