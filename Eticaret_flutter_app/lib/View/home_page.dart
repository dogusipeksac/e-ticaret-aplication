
import 'package:e_ticaret_flutter_app/View/filter_page.dart';
import 'package:e_ticaret_flutter_app/View/product_share_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'ad_detail_page.dart';
import '../Map/main_drawer.dart';
import '../DesignStyle/colors_cons.dart';

//anasayfa

class HomePage extends StatelessWidget {
  static String routeName = '/';
  void _onTileClicked(int index,var context){
    debugPrint("You tapped on item $index");
    Navigator.pushNamed(context, AdDetail.routeName);
  }

  @override
  Widget build(BuildContext context) {
    const double _radius = 3;
    final searchInput = TextField(
      cursorColor: searchText,
      style: TextStyle(
        color: searchText,
        fontWeight: FontWeight.bold,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 8),
        hintText: "Ürün Ara",
        hintStyle: TextStyle(color: searchTextHint),
        filled: true,
        fillColor: themeColor,
        enabledBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(_radius)),
          borderSide: BorderSide(color: themeColor),
        ),
        focusedBorder: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(_radius)),
          borderSide: BorderSide(color: themeColor),
        ),
        border: UnderlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(_radius)),
          borderSide: BorderSide(color: themeColor),
        ),
      ),
    );
    return Scaffold(
      backgroundColor: themeColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        elevation: 0,
        actions: <Widget>[
          IconButton(
            onPressed: () {Navigator.pushNamed(context, FilterPage.routeName);},
            icon: Icon(
              Icons.filter_list_rounded,
              color: Colors.white,
              size: 30,
            ),
          ),
        ],
        title: searchInput,
        backgroundColor: background,
      ),
      drawer: MainDrawer(),
      body: Container(
        decoration: new BoxDecoration(
          color: background,
        ),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Padding(
          padding: const EdgeInsets.only(bottom:35.0,left: 10.0,right: 10.0),
          child: ListView(
            children: List.generate(4, (index) {
              return InkResponse(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height/2,
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: filterBackground,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Image.asset("images/Opel_KARL.jpg",fit: BoxFit.fill),
                        ),
                        Expanded(
                          flex: 1,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex:1,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 15.0),
                                  child: Text("Urun ile ilgili baslik bulunacak.",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(color: text,fontSize: 18,fontFamily: 'Tienne',fontWeight: FontWeight.bold,),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Text("43.500 TL",
                                      style: TextStyle(
                                          color: themeColor,
                                          fontFamily: 'Tienne',
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          decoration: TextDecoration.lineThrough
                                      ),
                                    ),
                                    Text("60.000 TL",
                                      style: TextStyle(
                                        color: themeColor,
                                        fontSize: 25,
                                        fontFamily: 'Tienne',
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                onTap:() => _onTileClicked(index,context),
              );
            }),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, ProductSharePage.routeName);
        },
        elevation: 5,
        shape: CircleBorder(
            side: BorderSide(
                color: background,
                width: 3
            )
        ),
        child: const Icon(Icons.add,color: background,size: 40,),
        backgroundColor: themeColor,
      ),
    );
  }
}