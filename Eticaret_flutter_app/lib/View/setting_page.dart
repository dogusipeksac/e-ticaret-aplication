import 'dart:io';

import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:e_ticaret_flutter_app/Map/main_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

//Ayarlar sayfası
class SettingPage extends StatefulWidget {
  static String routeName = '/routeSetting';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  File _imageFile;
  firebase_storage.Reference ref;
  FirebaseAuth auth = FirebaseAuth.instance;
  final TextEditingController _isimControllerr = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  void takePhoto(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState(() {
      _imageFile = File(pickedFile.path);
    });
    /*var referansYol=FirebaseStorage.instance.ref().child("ProfilResimleri").
    child(auth.currentUser.uid).
    child("profilResmi.png");
    var yuklemeGorevi=referansYol.putFile(_imageFile);
    String url=await (await yuklemeGorevi.then((value){
    });*/
  }

  Stack ImageProfile() {
    return Stack(
      children: <Widget>[
        CircleAvatar(
          radius: 80,
          backgroundImage: _imageFile == null
              ? AssetImage(
                  "images/kapak.png",
                )
              : FileImage(File(_imageFile.path)),
        ),
        Positioned(
          bottom: 20,
          right: 20,
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                context: context,
                builder: ((builer) => bottomSheet()),
              );
            },
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 25,
            ),
          ),
        ),
      ],
    );
  }

  Widget bottomSheet() {
    return Container(
      height: 100,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: <Widget>[
          Text(
            "Profil resmini seç",
            style: TextStyle(fontSize: 20),
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              // ignore: deprecated_member_use
              FlatButton.icon(
                icon: Icon(Icons.camera),
                onPressed: () {
                  Navigator.pop(context);
                  takePhoto(ImageSource.camera);
                },
                label: Text("Kamera"),
              ),
              // ignore: deprecated_member_use
              FlatButton.icon(
                icon: Icon(Icons.image),
                onPressed: () {
                  Navigator.pop(context);
                  takePhoto(ImageSource.gallery);
                },
                label: Text("Galeri"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final konumField = TextFormField(
      controller: _locationController,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.location_on_rounded,
          color: Colors.white,
          size: 20,
        ),
        suffixIcon: Icon(Icons.pin_drop,color: Colors.white,size: 20,),
        hintText: "Adana/Seyhan",
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
    final uygulaButton = saveProfilButton();
    final sifreField = TextFormField(
      controller: _passwordController,
      style: TextStyle(color: Colors.white),
      obscureText: true,
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.vpn_key,
          color: Colors.white,
          size: 20,
        ),
        hintText: "***********",
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
    final isimField = TextFormField(
      controller: _isimControllerr,
      style: TextStyle(color: Colors.white),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.person_rounded,
          color: Colors.white,
          size: 20,
        ),
        hintText: 'Doğuş İpeksaç',
        hintStyle: TextStyle(color: Colors.white),
      ),
    );
    return Scaffold(
      backgroundColor: themeColor,
      appBar: settingScaffoldAppBar(),
      drawer: MainDrawer(),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: ImageProfile()),
                SizedBox(height: 20.0),
                settingTitlePackage('Profil İsmi'),
                SizedBox(height: 20.0),
                isimField,
                SizedBox(height: 20.0),
                settingTitlePackage('Şifre'),
                SizedBox(height: 10.0),
                sifreField,
                SizedBox(height: 20.0),
                settingTitlePackage('Konum'),
                SizedBox(height: 20.0),
                konumField,
                SizedBox(height: 30.0),
                Center(child: uygulaButton),
                SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
        decoration: new BoxDecoration(
            color: background,
            borderRadius:
                new BorderRadius.only(bottomRight: const Radius.circular(180))),
      ),
    );
  }

  AppBar settingScaffoldAppBar() {
    return AppBar(
      title: Text('Ayarlar'),
      backgroundColor: background,
    );
  }

  Text settingTitlePackage(String title) {
    return Text(title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white));
  }

  Material saveProfilButton() {
    return Material(
      borderRadius: BorderRadius.circular(1.0),
      color: background,
      // ignore: deprecated_member_use
      child: FlatButton(
        minWidth: 60,
        shape: RoundedRectangleBorder(side: BorderSide(color: text)),
        onPressed: () {},
        child: Text("UYGULA",
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}
