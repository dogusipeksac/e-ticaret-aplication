import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProductSharePage extends StatefulWidget {
  static String routeName = '/routeProductSharePage';

  @override
  _ProductSharePageState createState() => _ProductSharePageState();
}

class _ProductSharePageState extends State<ProductSharePage> {
  String valueChose;
  List listItem = ["2.El Araç", "1.El Araç", "Teknoloji", "Telefon", "Giyim"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('İlan detayı'),
        backgroundColor: background,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: FlatButton(),
                    margin: EdgeInsets.all(5),
                    width: 100,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              color: Colors.transparent,
              child: Column(
                children: <Widget>[
                  Text(
                    "Kategori",
                    style: TextStyle(color: themeColor),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButton(
                      hint: Text("Bir kategori seç..."),
                      dropdownColor: background,
                      icon: Icon(Icons.arrow_drop_down),
                      iconSize: 30,
                      isExpanded: true,
                      value: valueChose,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      ),
                      onChanged: (newValue) {
                        setState(() {
                          valueChose = newValue;
                        });
                      },
                      items: listItem.map((valueItem) {
                        return DropdownMenuItem(
                          value: valueItem,
                          child: Text(valueItem),
                        );
                      }).toList(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
