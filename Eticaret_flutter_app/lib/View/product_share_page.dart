import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Core/Service/product_share_service.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/for_text_style.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:path/path.dart' as Path;

class ProductSharePage extends StatefulWidget {
  static String routeName = '/routeProductSharePage';

  @override
  _ProductSharePageState createState() => _ProductSharePageState();
}

class _ProductSharePageState extends State<ProductSharePage> {
  String valueChoseCategory;
  String valueChoseProductState;

  ProductShareService _productSharePage = ProductShareService();
  //
  final ImagePicker imagePicker = ImagePicker();
  PickedFile profilImage;
  FirebaseAuth auth = FirebaseAuth.instance;
  List<File> image = [];
  List<String> urls = [];

  CollectionReference imgRef;
  bool uploading = false;
  double val = 0;
  firebase_storage.Reference ref;

  final TextEditingController _title = TextEditingController();
  final TextEditingController _price = TextEditingController();
  TextEditingController _explain = TextEditingController();

  List listItemCategory = [
    "2.El Araç",
    "1.El Araç",
    "Teknoloji",
    "Telefon",
    "Giyim"
  ];
  List listItemProductState = ["İyi", "Çok İyi", "Eski", "Orta"];

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool validation() {
    final FormState _form = _formKey.currentState;
    if (_form.validate()) {
      return true;
    } else {
      return false;
    }
  }

  choseImage() async {
    final pickedFile = await imagePicker.getImage(source: ImageSource.gallery);
    setState(() {
      image.add(File(pickedFile.path));
      if (pickedFile == null) retrieveLostData();
    });
  }

  Future uploadFile() async {
    int i = 1;
    for (var img in image) {
      setState(() {
        val = i / image.length;
      });
      ref = firebase_storage.FirebaseStorage.instance
          .ref()
          .child('Product Image Files/${auth.currentUser.uid}')
          .child(Path.basename(img.path));

      await ref.putFile(img).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          urls.add(value);
        });
      });
      i++;
    }
  }

  Future<void> retrieveLostData() async {
    final LostData response = await imagePicker.getLostData();
    if (response.file != null) {
      setState(() {
        image.add(File(response.file.path));
      });
    } else {
      print(response.file);
    }
  }

  @override
  Widget build(BuildContext context) {

    final title = TextFormField(
        validator: (value) {
          if (value == "") {
            return "Boş bırakılmaz.";
          } else if (value.length < 5) {
            return "En az 5 karakter olmalı başlık";
          }
          return null;
        },
        controller: _title,
        maxLines: 2,
        obscureText: false,
        cursorColor: themeColor,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 15,
          color: text,
        ),
        decoration: inputDecoraton("İlanınız için başlık giriniz."));

    final price = TextFormField(
        validator: (value) {
          if (value == "") {
            return "Boş bırakılmaz.";
          }
          return null;
        },
        controller: _price,
        maxLines: 2,
        obscureText: false,
        cursorColor: themeColor,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 15,
          color: text,
        ),
        decoration: inputDecoraton("İlanınız için fiyat giriniz."));
    final explane = TextFormField(
        validator: (value) {
          if (value == "") {
            return "Boş bırakılmaz.";
          } else if (value.length < 10) {
            return "En az 10 karakter olmalı başlık";
          }
          return null;
        },
        textDirection:TextDirection.ltr ,
        maxLines: 5,
        controller: _explain,
        obscureText: false,
        style: TextStyle(
          fontSize: 15,
          color: text,
        ),
        decoration: inputDecoraton("İlanınız için açıklama giriniz."));

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: background,
      appBar: produckShareScaffoldAppbar(),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(10),
              /*
            controller: myScrollConroller,*/
              children: [
                Container(
                  height: 130.0,
                  color: Colors.transparent,
                  child: Row(
                    children: <Widget>[
                      Expanded(
                        flex: 1,
                        child: Stack(
                          children: <Widget>[
                            GridView.builder(
                                scrollDirection: Axis.horizontal,
                                gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1),
                                itemCount: image.length + 1,
                                shrinkWrap: true,
                                itemBuilder: (context, index) {
                                  return index == 0
                                      ? Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(30),
                                    ),
                                    child: IconButton(
                                      icon: Icon(Icons.add),
                                      color: themeColor,
                                      iconSize: 40,
                                      onPressed: () {
                                        !uploading ? choseImage() : null;
                                      },
                                    ),
                                  )
                                      : Container(
                                    margin: EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius.circular(30),
                                      image: DecorationImage(
                                          image:
                                          FileImage(image[index - 1]),
                                          fit: BoxFit.cover),
                                    ),
                                  );
                                }),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Kategori",
                  style: TextStyle(color: themeColor, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return "Lütfen birini seçin...";
                    }
                    return null;
                  },
                  dropdownColor: background,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  isExpanded: true,
                  decoration: inputDecoraton("Bir kategori seç..."),
                  value: valueChoseCategory,
                  style: textStyle,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoseCategory = newValue;
                    });
                  },
                  items: listItemCategory.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Başlık",
                  style: TextStyle(color: themeColor, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                title,
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Fiyat",
                  style: TextStyle(color: themeColor, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                price,
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Durum",
                  style: TextStyle(color: themeColor, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  validator: (value) {
                    if (value == null) {
                      return "Boş bırakılmaz.";
                    }
                    return null;
                  },
                  dropdownColor: background,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  isExpanded: true,
                  decoration: inputDecoraton("Bir durum seç..."),
                  value: valueChoseProductState,
                  style: textStyle,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoseProductState = newValue;
                    });
                  },
                  items: listItemProductState.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Tanım",
                  style: TextStyle(color: themeColor, fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                explane,
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 45,
                  margin: EdgeInsets.only(right: 50,left: 50,bottom: 20,top: 20),
                  decoration: BoxDecoration(
                    color: themeColor,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: FlatButton(
                    onPressed: () {
                      setState(() {
                        if (validation()) {
                          uploadFile().whenComplete(() => _productSharePage
                              .addProduct(
                              auth.currentUser.uid,
                              urls.length >= 1 ? urls[0] : "",
                              urls.length >= 2 ? urls[1] : "",
                              urls.length >= 3 ? urls[2] : "",
                              urls.length >= 4 ? urls[3] : "",
                              urls.length >= 5 ? urls[4] : "",
                              valueChoseCategory,
                              _title.text,
                              _price.text,
                              valueChoseProductState,
                              _explain.text)
                              .whenComplete(() => Navigator.of(context).pop()));
                          uploading = true;
                        }
                      });
                    },
                    child: Text(
                      "İlanı Paylaş",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 25,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          uploading
              ? Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  child: Text(
                    "uploading...",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CircularProgressIndicator(
                    value: val,
                    valueColor:
                    AlwaysStoppedAnimation<Color>(Colors.green)),
              ],
            ),
          )
              : Container(),
        ],
      ),
    );
  }

  InputDecoration inputDecoraton(String hintText) {
    return InputDecoration(
      fillColor: filterBackground,
      focusColor: filterBackground,
      hintText: hintText,
      hintStyle: TextStyle(color: Colors.white),
      enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          )),
      disabledBorder:  OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      errorBorder:  OutlineInputBorder( borderSide: BorderSide(
        color: Colors.red,
      )),
      focusedBorder:  OutlineInputBorder(
        borderSide: BorderSide(
          color: themeColor,
        ),
      ),
      focusedErrorBorder:   OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.red,
        ),
      ),
    );
  }

  AppBar produckShareScaffoldAppbar() {
    return AppBar(
      title: Text('İlan detayı'),
      backgroundColor: background,
    );
  }

  @override
  void initState() {
    super.initState();
    /*
    imgRef = FirebaseFirestore.instance.collection('imageURLs');*/
  }
}