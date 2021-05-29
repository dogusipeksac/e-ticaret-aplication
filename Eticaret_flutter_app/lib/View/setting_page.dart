import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Core/Controller/user_controller.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:e_ticaret_flutter_app/Map/main_drawer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';

//Ayarlar sayfası
class SettingPage extends StatefulWidget {
  static String routeName = '/routeSetting';

  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool obsture=true;
  File _imageFile;
  final picker=ImagePicker();
  final auth = FirebaseAuth.instance;
  UserController userController = UserController();
  String downloadUrl;
  bool uploading = false;
  final TextEditingController _isimControllerr = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();


   Future baglantiAl() async{
    var baglanti =await FirebaseStorage
        .instance.ref()
        .child("Profil Resimleri")
        .child(auth.currentUser.uid)
        .child("profilResmi.jpg").getDownloadURL();
    setState((){
      downloadUrl=  baglanti;
    });
  }
  initState(){
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => baglantiAl());
  }

  Future uploadFile()async{

    var referenceYol=FirebaseStorage
        .instance.ref()
        .child("Profil Resimleri")
        .child(auth.currentUser.uid)
        .child("profilResmi.jpg");

    var yuklemeGorevi=referenceYol.putFile(_imageFile);

    await (await yuklemeGorevi.whenComplete(() async{

      var url= await referenceYol.getDownloadURL();
      print(url);
      setState((){
        downloadUrl=url;
      });
    }));
  }


  void onImageButtonPressed(ImageSource source)async{
     try{
          await takePhoto(source);
     }catch(e){
      print(e);
     }
  }


  Future takePhoto(ImageSource source) async {
    final pickedFile = await ImagePicker().getImage(source: source);
    setState((){
      _imageFile = File(pickedFile.path);
      uploadFile();

    });
  }



  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: background,
      appBar: settingScaffoldAppBar(),
      drawer: MainDrawer(),
      body: SingleChildScrollView(
        child: Consumer<User>(
          builder: (context, user, child) => StreamBuilder<DocumentSnapshot>(
              stream: userController.getPath().snapshots(),
              builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return Text("Birşeyler yanlış gitti");
                }
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                _isimControllerr.text= snapshot.data['name'];
                _passwordController.text=snapshot.data['password'];
                _locationController.text=snapshot.data['location'];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Center(child: Stack(
                      children: <Widget>[
                        CircleAvatar(
                          radius: 80,
                          backgroundImage: downloadUrl == null ?
                          AssetImage("images/profile.png",)
                          :NetworkImage(downloadUrl)
                        ),
                        Positioned(
                          bottom: 20,
                          right: 20,
                          child: InkWell(
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: ((builer) => Container(
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
                                              setState(() {
                                                Navigator.pop(context);
                                                onImageButtonPressed(ImageSource.camera);
                                              });
                                            },
                                            label: Text("Kamera"),
                                          ),
                                          // ignore: deprecated_member_use
                                          FlatButton.icon(
                                            icon: Icon(Icons.image),
                                            onPressed: () {
                                              setState(() {
                                                Navigator.pop(context);
                                                onImageButtonPressed(ImageSource.gallery);
                                              });

                                            },
                                            label: Text("Galeri"),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )),
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
                    )),
                    SizedBox(height: 20.0),
                    settingTitlePackage('Profil İsmi'),
                    SizedBox(height: 20.0),
                    TextFormField(
                      controller: _isimControllerr,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: Decoration(
                          Icons.person_rounded,'İsminizi giriniz',null),
                    ),
                    SizedBox(height: 20.0),
                    settingTitlePackage('Şifre'),
                    SizedBox(height: 10.0),
                    TextFormField(
                        controller: _passwordController,
                        style: TextStyle(color: Colors.white),
                        obscureText: obsture,
                        cursorColor: Colors.white,
                        decoration: Decoration(
                            Icons.vpn_key, 'Şifreniz',Icons.remove_red_eye)),
                    SizedBox(height: 20.0),
                    settingTitlePackage('Konum'),
                    SizedBox(height: 20.0),
                    TextFormField(
                        controller: _locationController,
                        style: TextStyle(color: Colors.white),
                        cursorColor: Colors.white,
                        decoration: Decoration(Icons.location_on_rounded,
                            'Konum:',null)),
                    SizedBox(height: 30.0),
                    Center(
                        child: Material(
                      borderRadius: BorderRadius.circular(1.0),
                      color: background,
                      // ignore: deprecated_member_use
                      child: FlatButton(
                        minWidth: 60,
                        shape: RoundedRectangleBorder(
                            side: BorderSide(color: text)),
                        onPressed: (){
                         setState(() {
                           userController.updateUser(
                               user.uid,
                               _locationController.text,
                               _isimControllerr.text,
                               _passwordController.text,
                               downloadUrl).whenComplete(() =>Navigator.pushNamed(context, SettingPage.routeName));
                           uploading = true;
                         });
                        },
                        child: Text("UYGULA",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold)),
                      ),
                    )),
                    SizedBox(height: 40.0),
                  ],
                );
              }),
        ),
      ),
    );
  }

  InputDecoration Decoration(IconData icon, String labelText,IconData suffexicon) {
    return InputDecoration(

      prefixIcon: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
      suffixIcon: GestureDetector(
        onTap: (){
            obsture=true;
        },
        child: Icon( suffexicon,
          color: Colors.white,
          size: 20,),
      ),
      labelText: labelText,
      labelStyle: TextStyle(color: Colors.white),
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
}
