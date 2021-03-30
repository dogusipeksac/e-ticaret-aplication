import 'package:e_ticaret_flutter_app/colors_cons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'main_drawer.dart';

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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 55,
                        height: 55,
                        color: filterBackground,
                        child: CircleAvatar(
                          backgroundColor: filterBackground,
                          foregroundColor: filterBackground,
                          backgroundImage: NetworkImage(
                              "https://www.nj.com/resizer/h8MrN0-Nw5dB5FOmMVGMmfVKFJo=/450x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/SJGKVE5UNVESVCW7BBOHKQCZVE.jpg"),
                        ),
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            names[index] + "  son ilanını beğendi",
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
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
