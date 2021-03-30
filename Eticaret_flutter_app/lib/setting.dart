import 'package:flutter/material.dart';

import 'colors_cons.dart';
import 'main_drawer.dart';

//Ayarlar sayfası
class Setting extends StatelessWidget {
  static String routeName = '/routeSetting';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: themeColor,
        appBar: AppBar(title: Text('Ayarlar'),backgroundColor: background,),
        drawer: MainDrawer(),
        body: SettingPage(),
      );

  }
}

class SettingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SettingHome(context);
  }
}

Widget SettingHome(BuildContext context) {
  final isimField = TextField(
    style: TextStyle(color: Colors.white),
    cursorColor: Colors.white,
    obscureText: false,
    decoration: InputDecoration(
      hintText: 'Doğuş İpeksaç',
      hintStyle: TextStyle(color: Colors.white),
    ),
  );
  final sifreField = TextField(
    style: TextStyle(color: Colors.white),
    cursorColor: Colors.white,
    obscureText: false,
    decoration: InputDecoration(
      hintText: '************',
      hintStyle: TextStyle(color: Colors.white),
    ),
  );
  final konumField = TextField(
    style: TextStyle(color: Colors.white),
    cursorColor: Colors.white,
    obscureText: false,
    decoration: InputDecoration(
      hintText: 'Adana/Seyhan',
      hintStyle: TextStyle(color: Colors.white),
    ),
  );
  final uygulaButton = Material(
    elevation: 8.0,
    borderRadius: BorderRadius.circular(1.0),
    color: background,
    // ignore: deprecated_member_use
    child: FlatButton(
      minWidth: 50,
      onPressed: () {},
      child: Text("UYGULA",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );


  return Center(
    child: Container(
      child: Padding(
        padding:  EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Image.asset("Image/kapak.png",)),
            SizedBox(height: 10.0),
            Text('Profil İsmi',style: TextStyle(fontWeight: FontWeight.bold,color:acikBeyaz)),
            SizedBox(height: 10.0),
            isimField,
            SizedBox(height: 10.0),
            Text('Şifre',style: TextStyle(fontWeight: FontWeight.bold,color:acikBeyaz)),
            SizedBox(height: 10.0),
            sifreField,
            SizedBox(height: 10.0),
            Text('Konum',style: TextStyle(fontWeight: FontWeight.bold,color:acikBeyaz)),
            SizedBox(height: 10.0),
            konumField,
            SizedBox(height: 15.0),
            Center(child: uygulaButton),
            SizedBox(height: 15.0),

          ],
        ),
      ),
      decoration:new BoxDecoration(
          color: background,
          borderRadius: new BorderRadius.only(
              bottomRight: const Radius.circular(180)
          )
      ),
    ),
  );

}
