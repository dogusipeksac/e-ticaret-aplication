import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import '../DesignStyle/colors_cons.dart';
import '../Map/main_drawer.dart';

//Ayarlar sayfası
class SettingPage extends StatefulWidget {
  static String routeName = '/routeSetting';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

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

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(source: source);
    setState(() {
      _imageFile = pickedFile;
    });
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeColor,
      appBar: AppBar(
        title: Text('Ayarlar'),
        backgroundColor: background,
      ),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            padding: EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(child: ImageProfile()),
                SizedBox(height: 20.0),
                Text('Profil İsmi',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 20.0),
                isimField,
                SizedBox(height: 20.0),
                Text('Şifre',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 10.0),
                sifreField,
                SizedBox(height: 20.0),
                Text('Konum',
                    style: TextStyle(
                        fontWeight: FontWeight.bold, color: Colors.white)),
                SizedBox(height: 20.0),
                konumField,
                SizedBox(height: 30.0),
                Center(child: uygulaButton),
                SizedBox(height: 40.0),
              ],
            ),
            decoration: new BoxDecoration(
                color: background,
                borderRadius: new BorderRadius.only(
                    bottomRight: const Radius.circular(180))),
          ),
        ),
      ),
    );
  }
}
