import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';

//ilan detay sayfası
class AdDetail extends StatelessWidget {
  static String routeName = '/routeAdDetailPage';
  String product = "2034 Opel Corsa";
  String price = "43.500 TL";
  String info = "Araç temizdir boya değişen yok.\n Hasar kaydı temiz,\n 25.000 Km \n Memurdan "
      "\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\nV";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      bottomNavigationBar: BottomAppBar(
        color: filterBackground,
        child: Row(
          children: [
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text("Mesaj At",
                  style: TextStyle(color: background,fontSize: 20,fontFamily: 'Tienne'),
                ),
              ),
              style:ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)
                  ),
                  primary: themeColor,
                  elevation: 10
              ),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3,horizontal: 30),
                  child: Text("Ara",
                    style: TextStyle(color: background,fontSize: 20,fontFamily: 'Tienne'),
                  ),
                ),
                style:ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: themeColor,
                  elevation: 10,

                )
            ),
            Spacer(),
          ],
        ),
      ),
      body: Container(
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset("images/Opel_KARL.jpg",fit: BoxFit.fill,),
                Padding(
                  padding: const EdgeInsets.only(top:15.0,left: 15),
                  child: Text(price,
                    style: TextStyle(color: themeColor,fontSize: 30,fontFamily: "Tienne",),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 5,left: 15),
                  child: Text(product,
                    style: TextStyle(color: text,fontSize: 25,fontFamily: "Tienne",),
                  ),
                ),
              ],
            ),

            DraggableScrollableSheet(
              maxChildSize: 0.47,
              minChildSize: 0.47,
              initialChildSize: 0.47,
              builder: (context, scrollController) {
                return SingleChildScrollView(
                    controller: scrollController,
                    child:Padding(
                      padding: const EdgeInsets.only(left: 15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Açıklama :",
                            style: TextStyle(
                              fontSize: 19,
                              fontFamily: "Tienne",
                              fontWeight: FontWeight.bold,
                              color: text,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: Text(info,
                              style: TextStyle(
                                fontSize: 19,
                                fontFamily: "Tienne",
                                color: text,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}