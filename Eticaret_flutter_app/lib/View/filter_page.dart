
import 'package:e_ticaret_flutter_app/Core/Service/product_share_service.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/for_text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FilterPage extends StatefulWidget {
  static String routeName = '/routeFilterPage';
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  String valueChoseCategoryOnTheFilter;
  String valueChoseLocation;
  String selectedButtonSmartSort="";
  final TextEditingController _minimum = TextEditingController();
  final TextEditingController _maximum = TextEditingController();

  ProductShareService _productSharePage = ProductShareService();
  String image = "";

  List listItemCategory = [
    "2.El Araç",
    "1.El Araç",
    "Teknoloji",
    "Telefon",
    "Giyim"
  ];
  List listItemCityState = ["Adana", "Mersin", "İstanbul", "Malatya"];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width * 2;
    double height = MediaQuery.of(context).size.height * 2;

    final minumumPrize = TextField(
        controller: _minimum,
        obscureText: false,
        cursorColor: themeColor,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(
          fontSize: 18,
          color: text,
        ),
        decoration: InputDecoration(
          hintText: "Minimum(TL)",
          hintStyle: TextStyle(color: textDarkHint),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: filterBackground, width: 0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: filterBackground, width: 0),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: filterBackground, width: 0),
          ),
        ));
    final maximumPrize = TextField(
        controller: _maximum,
        obscureText: false,
        cursorColor: themeColor,
        textAlign: TextAlign.start,
        textAlignVertical: TextAlignVertical.bottom,
        style: TextStyle(
          fontSize: 18,
          color: text,
        ),
        decoration: InputDecoration(
          hintText: "Maximum(TL)",
          hintStyle: TextStyle(color: textDarkHint),
          enabledBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: filterBackground, width: 0),
          ),
          focusedBorder: UnderlineInputBorder(
            borderSide: BorderSide(color: filterBackground, width: 0),
          ),
          border: UnderlineInputBorder(
            borderSide: BorderSide(color: filterBackground, width: 0),
          ),
        ));

    return Scaffold(
      //resizeToAvoidBottomInset: false,
      backgroundColor: background,
      appBar: AppBar(
        title: Text('Filtrele'),
        backgroundColor: background,
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.all(10),
          /*
              controller: myScrollConroller,*/
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                "Tüm Kategori",
                style: filterStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
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
                  value: valueChoseCategoryOnTheFilter,
                  style: textStyle,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoseCategoryOnTheFilter = newValue;
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
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                "Fiyat Aralığı",
                style: filterStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1, right: 10),
                      child: Container(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, bottom: 2),
                          child: minumumPrize,
                        ),
                        height: 50,
                        decoration: BoxDecoration(
                          color: filterBackground,
                          border:
                              Border.all(color: filterBackground, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 1, right: 10),
                      child: Container(
                        child: Padding(
                          padding:
                              const EdgeInsets.only(left: 15.0, bottom: 2),
                          child: maximumPrize,
                        ),
                        height: 50,
                        decoration: BoxDecoration(
                          color: filterBackground,
                          border:
                              Border.all(color: filterBackground, width: 1),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                "Konum",
                style: filterStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Container(
                padding: EdgeInsets.only(left: 14, right: 14),
                decoration: BoxDecoration(
                  color: filterBackground,
                  border: Border.all(color: filterBackground, width: 1),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: DropdownButton(
                  hint: Text(
                    "Bir şehir seç...",
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
                  value: valueChoseLocation,
                  style: textStyle,
                  onChanged: (newValue) {
                    setState(() {
                      valueChoseLocation = newValue;
                    });
                  },
                  items: listItemCityState.map((valueItem) {
                    return DropdownMenuItem(
                      value: valueItem,
                      child: Text(valueItem),
                    );
                  }).toList(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Text(
                "Sırala",
                style: filterStyle,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
              child: Column(
                children: [
                  Row(
                    children:<Widget> [
                      ForShortContainer(
                        onPressed: () {
                          setState(() {
                            selectedButtonSmartSort = 'Akıllı';
                          });
                        },
                        color: selectedButtonSmartSort == 'Akıllı'
                            ? themeColor
                            : filterBackground,
                        child: Center(child: Text("Akıllı Sıralama",style: textStyle,)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      ForShortContainer(
                        onPressed: () {
                          setState(() {
                            selectedButtonSmartSort = 'Düşük';
                          });
                        },
                        color: selectedButtonSmartSort == 'Düşük'
                            ? themeColor
                            : filterBackground,
                        child: Center(child: Text("Azalan fiyat",style: textStyle,)),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      ForShortContainer(
                        onPressed: () {
                          setState(() {
                            selectedButtonSmartSort = 'Yüksek';
                          });
                        },
                        color: selectedButtonSmartSort == 'Yüksek'
                            ? themeColor
                            : filterBackground,
                        child: Center(child: Text("Artan fiyat",style: textStyle,)),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                   /*   ForShortContainer(
                        onPressed: () {
                          setState(() {
                            selectedButtonSmartSort = '';
                          });
                        },
                      ),*/
                    ],
                  ),
                ],
              ),
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
                  onPressed: () {},
                  child: Text(
                    "Filtrele",
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
}

class ForShortContainer extends StatelessWidget {
  final Function onPressed;
  final Widget child;
  final Color color;

  ForShortContainer({this.onPressed, this.child, this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: this.onPressed,
      child: Container(
          child: this.child,
          height: 50,
          width: 150,
          padding: EdgeInsets.only(left: 14, right: 14),
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: filterBackground, width: 1),
            borderRadius: BorderRadius.circular(15),
          )),
    );
  }
}
