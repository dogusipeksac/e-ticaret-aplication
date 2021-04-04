import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:e_ticaret_flutter_app/View/message_detail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Map/main_drawer.dart';

//bildirimler sayfasi
class MessageList extends StatelessWidget {
  List message = [
    "Opel corsa 2",
    "Opel corsa ",
    "Ölücüler yazması",
    "2 El demezsin",
    "Bu fiyata bulurs",
    "Sahibinden tertemiz",
    "Böyle birşey görmemişsindir",
    "Eski sevg",
    "Bunu al dua edeceksin",
    "Al kullan"
  ];
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
  List ad_Detail = [
    "2034 model hatasız",
    "çalıntı 28181 model",
    "tertemiz 0 ayarında ",
    "2 El demezsin",
    "2 tane alacam",
    "tertemiz",
    "görmemişsindir",
    "sad asEski sevg",
    "Beksin",
    "Al kullan"
  ];

  static String routeName = '/routeMessageList';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('Mesajlar-Hepsi'),
        backgroundColor: background,
      ),
      drawer: MainDrawer(),
      body: ListView.builder(
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: GestureDetector(
            onTap: () {Navigator.pushNamed(context, MessageDetail.routeName);},
            child: Card(
              color: background,
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Container(
                decoration: BoxDecoration(
                  color: filterBackground,
                ),
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
                          child: Container(
                            child: CircleAvatar(
                              backgroundImage: NetworkImage(
                                  "https://www.nj.com/resizer/h8MrN0-Nw5dB5FOmMVGMmfVKFJo=/450x0/smart/cloudfront-us-east-1.images.arcpublishing.com/advancelocal/SJGKVE5UNVESVCW7BBOHKQCZVE.jpg"),
                            ),
                            width: 20,
                            height: 20,
                            color: Colors.transparent,
                            margin: EdgeInsets.only(left: 40, top: 30),
                          ),
                          backgroundColor: filterBackground,
                          foregroundColor: filterBackground,
                          backgroundImage: NetworkImage(
                              "https://www.kaclitreyakar.com/wp-content/uploads/2020/09/2020-opel-corsa-5.jpg"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            ad_Detail[index],
                            style: TextStyle(color: themeColor, fontSize: 15),
                          ),
                          Text(
                            names[index],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                          SizedBox(
                            height: 2,
                          ),
                          Text(
                            message[index],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:EdgeInsets.only(left: 20),
                      child: PopupMenuButton(
                        elevation: 5,
                        icon: Icon(Icons.more_vert,color:themeColor),
                        color: themeColor,
                        itemBuilder: (BuildContext bc) => [
                          PopupMenuItem(child: Text("Sil",style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),)),
                        ],
                        onSelected: (route) {
                          print(route);
                          // Note You must create respective pages for navigation
                          Navigator.pushNamed(context, route);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
