import 'dart:io';
import 'package:e_ticaret_flutter_app/Database/product_share_service.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/for_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class ProductSharePage extends StatefulWidget {
  static String routeName = '/routeProductSharePage';

  @override
  _ProductSharePageState createState() => _ProductSharePageState();
}

class _ProductSharePageState extends State<ProductSharePage> {
  String valueChoseCategory;
  String valueChoseProductState;

  ProductShareService _productSharePage = ProductShareService();
  final ImagePicker _imagePicker = ImagePicker();
  dynamic _pickImage;
  PickedFile profilImage;

  Widget imagePlace() {
    double height = MediaQuery.of(context).size.height;
    if (profilImage != null) {
      return CircleAvatar(
        backgroundImage: FileImage(File(profilImage.path)),
      );
    }
  }

  final TextEditingController _title = TextEditingController();
  final TextEditingController _price = TextEditingController();
  String image = "images/Opel_KARL.jpg";
  TextEditingController _explain = TextEditingController();

  List listItemCategory = [
    "2.El Araç",
    "1.El Araç",
    "Teknoloji",
    "Telefon",
    "Giyim"
  ];
  List listItemProductState = ["İyi", "Çok İyi", "Eski", "Orta"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 2;
    double height = MediaQuery.of(context).size.height * 2;

    final title = productShareTextfieldPackage(
        _title, false, "İlanınız için başlık giriniz.", 1);

    final price = productShareTextfieldPackage(
        _price, false, "İlanınız için fiyat giriniz.", 1);
    final explane = productShareTextfieldPackage(
        _explain, false, "İlanınız için tanım giriniz.", 5);

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: background,
      appBar: produckShareScaffoldAppbar(),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          /*
          controller: myScrollConroller,*/
          children: [
            Container(
              height: 150.0,

              color: Colors.transparent,
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: littleImageSharePage(),
                  ),
                  Expanded(
                    flex: 1,
                    child: littleImageSharePage(),
                  ),
                  Expanded(
                    flex: 1,
                    child:littleImageSharePage(),
                  ),
                  Expanded(
                    flex: 1,
                    child:littleImageSharePage(),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Kategori",
                style: TextStyle(color: themeColor, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  color: filterBackground,
                  border: Border.all(color: filterBackground, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                  hint: Text(
                    "Bir kategori seç...",
                    style: textStyle,
                  ),
                  dropdownColor: background,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  isExpanded: true,
                  underline: SizedBox(),
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
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Başlık",
                style: TextStyle(color: themeColor, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  color: filterBackground,
                  border: Border.all(color: filterBackground, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: title,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Fiyat",
                style: TextStyle(color: themeColor, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  color: filterBackground,
                  border: Border.all(color: filterBackground, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: price,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Durum",
                style: TextStyle(color: themeColor, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                padding: EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  color: filterBackground,
                  border: Border.all(color: filterBackground, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                  hint: Text(
                    "Bir durum seç...",
                    style: textStyle,
                  ),
                  dropdownColor: background,
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.white,
                  ),
                  iconSize: 30,
                  isExpanded: true,
                  underline: SizedBox(),
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
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "Tanım",
                style: TextStyle(color: themeColor, fontSize: 20),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                height: 150,
                padding: EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  color: filterBackground,
                  border: Border.all(color: filterBackground, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: explane,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                padding: EdgeInsets.only(left: 14, right: 14),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: themeColor,
                  border: Border.all(color: filterBackground, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: FlatButton(
                  onPressed: () {
                    // _productSharePage.addProduct(image,
                    //     valueChoseCategory,
                    //     _title.text,
                    //     _price.text,
                    //     valueChoseProductState,
                    //     _explain.text);
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
            ),
          ],
        ),
      ),
    );
  }

  Container littleImageSharePage() {
    return Container(
      child: FlatButton(
        child: Icon(Icons.add),
        onPressed: () {
          _onButtonPressedImageAdd();
        },
      ),
      margin: EdgeInsets.all(5),
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
    );

  }

  AppBar produckShareScaffoldAppbar() {
    return AppBar(
      title: Text('İlan detayı'),
      backgroundColor: background,
    );
  }

  TextField productShareTextfieldPackage(
    TextEditingController controller,
    bool obscureText,
    String label,
    int lineCount,
  ) {
    return TextField(

        maxLines: lineCount,
        controller: _title,
        obscureText: false,
        cursorColor: themeColor,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.center,
        style: TextStyle(
          fontSize: 15,
          color: text,
        ),
        decoration: InputDecoration(
          labelText: "İlanınız için başlık giriniz.",
          labelStyle: TextStyle(color: textDarkHint),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: filterBackground),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: filterBackground),
          ),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: filterBackground),
          ),
        ));
  }

  void _onButtonPressedImageAdd() {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        context: context,
        builder: (context) {
          return Container(
            height: 120,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                color: background),
            child: Column(
              children: <Widget>[
                ListTile(
                  leading: Icon(
                    Icons.photo_camera_outlined,
                    color: Colors.white,
                  ),
                  title: Text(
                    'Kamera',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
                ListTile(
                  leading:
                      Icon(Icons.photo_album_outlined, color: Colors.white),
                  title: Text(
                    'Galeri',
                    style: TextStyle(color: Colors.white),
                  ),
                  onTap: () {},
                ),
              ],
            ),
          );
        });
  }
}
