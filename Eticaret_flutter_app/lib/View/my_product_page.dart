import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Map/main_drawer.dart';

//bildirimler sayfasi
class MyProduct extends StatelessWidget {
  List aciklama = [
    "Opel corsa 2034 model hatasız",
    "Opel corsa çalıntı 28181 model",
    "Ölücüler yazmasın tertemiz 0 ayarında ",
    "2 El demezsin",
    "Bu fiyata bulursanız 2 tane alacam",
    "Sahibinden tertemiz",
    "Böyle birşey görmemişsindir",
    "Eski sevgilimin arabası satılıktır",
    "Bunu al dua edeceksin",
    "Al kullan"
  ];
  List fiyat = [
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
        padding: EdgeInsets.only(bottom:40),
        itemCount: 10,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) => Container(
          height: 100,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
          child: Card(
            color: background,
            elevation: 2.0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0.0),
            ),
            child: Container(
              decoration: BoxDecoration(
                  color: filterBackground,
                  borderRadius: BorderRadius.all(Radius.circular(10.0))),
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(flex: 1,
                    child: Container(
                      color: filterBackground,
                      child: CircleAvatar(
                        backgroundColor: filterBackground,
                        foregroundColor: filterBackground,
                        backgroundImage: NetworkImage(
                            "https://www.kaclitreyakar.com/wp-content/uploads/2020/09/2020-opel-corsa-5.jpg"),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 3.0,
                  ),
                  Expanded(flex: 2,
                    child: Container(

                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            fiyat[index].toString() + "  Türk Lirası",
                            style: TextStyle(color: themeColor, fontSize: 15),
                          ),
                          SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            aciklama[index],
                            style: TextStyle(color: Colors.white, fontSize: 15),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(flex: 1,
                    child: Container(

                      padding:
                          EdgeInsets.only(left: 20),
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        shape: CircleBorder(side: BorderSide(color: background, width: 3)),
        child: const Icon(
          Icons.add,
          color: background,
          size: 40,
        ),
        backgroundColor: themeColor,
      ),
    );
  }
}
