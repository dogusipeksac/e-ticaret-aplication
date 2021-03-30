import 'package:e_ticaret_flutter_app/colors_cons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'main_drawer.dart';

//bildirimler sayfasi
class MyProduct extends StatelessWidget {
  List aciklama = [
    "Opel corsa 2034 model hatasız",
    "Opel corsa çalıntı 28181 model",
    "Ölücüler yazmasın tertemiz 0 ayarında",
    "2 El demezsin",
    "Bu fiyata bulursanız 2 tane alacam",
    "Sahibinden tertemiz",
    "Böyle birşey görmemişsindir",
    "Eski sevgilimin arabası satılıktır",
    "Bunu al dua edeceksin",
    "Al kullan"
  ]; List fiyat = [
    10,
    20,
    30,
    500,
    100,
    500,
    1,
    2,
    3,
    4,
  ];

  static String routeName = '/routeMyProduct';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('Ürünlerim'),
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
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Container(
                        width: 55,
                        height: 55,
                        color: filterBackground,
                        child: CircleAvatar(
                          backgroundColor: filterBackground,
                          foregroundColor: filterBackground,
                          backgroundImage: NetworkImage("https://www.kaclitreyakar.com/wp-content/uploads/2020/09/2020-opel-corsa-5.jpg"),
                        ),
                      ),
                      SizedBox(
                        width: 6.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            fiyat[index].toString() + "  Türk Lirası",
                            style: TextStyle(color: themeColor, fontSize: 15),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            aciklama[index],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                     /* Container(width: 55,height: 55,
                        alignment: Alignment.center,
                        padding: EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
                        child: PopupMenuButton(

                          itemBuilder: (BuildContext bc) => [
                            PopupMenuItem(child: Text("Sil")),
                          ],
                          onSelected: (route) {
                            print(route);
                            // Note You must create respective pages for navigation
                            Navigator.pushNamed(context, route);
                          },
                        ),
                      ),*/
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
