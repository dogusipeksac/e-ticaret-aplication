import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Map/main_drawer.dart';

//bildirimler sayfasi
class Notifications extends StatelessWidget {
  List names = [
    "Doğuş İpeksaç",
    "Bünyamin Ertaş",
    "Tuba Günaçgün",
    "Bekir Demir",
    "Volkan Üstekidag",
    "Ali",
    "Zeynep",
    "Nagihan",
    "Güler",
    "Alamettin"
  ];

  static String routeName = '/routeNotificationPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('Bildirimler'),
        backgroundColor: background,
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          width: MediaQuery.of(context).size.width,
          height: 100,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            color: background,
            elevation: 5.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              decoration:  BoxDecoration(
                  color: filterBackground,
                borderRadius:
                BorderRadius.all(Radius.circular(10.0))),

              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      height: 55,
                      color: filterBackground,
                      child: CircleAvatar(
                        backgroundColor: filterBackground,
                        foregroundColor: filterBackground,
                        backgroundImage: NetworkImage(
                            "https://www.nj.com/resizer/h8MrN0-Nw5dB5FOmMVGMmfVKFJo=/450x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/SJGKVE5UNVESVCW7BBOHKQCZVE.jpg"),
                      ),
                    ),
                  ),

                  Expanded(
                    flex: 4,
                    child: Container(
                      margin: EdgeInsets.all(5),
                      alignment: Alignment.centerLeft,
                      child: Text(
                        names[index] + " son ilanını beğendi",

                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),

                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
