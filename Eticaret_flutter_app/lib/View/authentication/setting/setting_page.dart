import 'dart:io';

import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:e_ticaret_flutter_app/Map/main_drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

//Ayarlar sayfası
class SettingPage extends StatefulWidget {
  static String routeName = '/routeSetting';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();
  final TextEditingController _isimControllerr = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

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
    final konumField =
        settingTextFieldPackage(_locationController, false, "Adana/Seyhan",Icons.location_on_rounded);
    final uygulaButton = saveProfilButton();
    final sifreField =
        settingTextFieldPackage(_passwordController, true, "***********",Icons.vpn_key);
    final isimField =
        settingTextFieldPackage(_isimControllerr, false, 'Doğuş İpeksaç',Icons.person_rounded);
    return Scaffold(
      backgroundColor: themeColor,
      appBar: settingScaffoldAppBar(),
      drawer: MainDrawer(),
      body:
          settingScaffoldBody(isimField, sifreField, konumField, uygulaButton),
    );
  }

  AppBar settingScaffoldAppBar() {
    return AppBar(
      title: Text('Ayarlar'),
      backgroundColor: background,
    );
  }

  SingleChildScrollView settingScaffoldBody(TextField isimField,
      TextField sifreField, TextField konumField, Material uygulaButton) {
    return SingleChildScrollView(
      child: Center(
        child: Container(
          padding: EdgeInsets.all(15.0),
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
          decoration: new BoxDecoration(
              color: background,
              borderRadius: new BorderRadius.only(
                  bottomRight: const Radius.circular(180))),
        ),
      ),
    );
  }

  Text settingTitlePackage(String title) {
    return Text(title,
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white));
  }

  Material saveProfilButton() {
    return Material(
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
  }
}

TextField settingTextFieldPackage(
    TextEditingController controller, bool obscureText, String hintText,IconData icon) {
  return TextField(
    controller: controller,
    style: TextStyle(color: Colors.white),
    cursorColor: Colors.white,
    obscureText: obscureText,
    decoration: InputDecoration(
      prefixIcon: Icon(icon,color: Colors.white,size: 20,),
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white),
    ),
  );
}
