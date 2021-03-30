import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'main_drawer.dart';
import 'register.dart';
import 'color_cons.dart';

//anasayfa
class HomePage extends StatelessWidget {
  static String routeName = '/';
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
            onPressed: () {},
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
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(4, (index) {
            return Center(
              child: Container(
                height: 190,
                width: 180,
                decoration: BoxDecoration(
                  color: filterBackground,
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 80,
                        height: 80,
                        margin: EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          color: text,
                          boxShadow: [BoxShadow(color: background,blurRadius: 12)],
                          borderRadius: BorderRadius.all(Radius.circular(21))
                        ),
                        child: Center(
                          child: Image.asset("assets/images/Opel_KARL.jpg",),
                        ),
                      ),
                    ),
                    SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Text("Urun ile ilgili baslik bulunacak.",
                        textAlign: TextAlign.start,
                        style: TextStyle(color: text,fontSize: 13,fontFamily: 'Tienne',),
                      ),
                    ),
                    SizedBox(height: 6),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Text("43.500 TL",
                        style: TextStyle(
                          color: themeColor,
                          fontFamily: 'Tienne',
                          fontSize: 11,
                          decoration: TextDecoration.lineThrough
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:15.0),
                      child: Text("60.000 TL",
                        style: TextStyle(
                          color: themeColor,
                          fontSize: 20,
                          fontFamily: 'Tienne'
                        ),
                      ),
                    ),

                  ],
                ),
              ),
            );
          }),
        ),
        decoration: new BoxDecoration(
            color: background,
            borderRadius: new BorderRadius.only(
                bottomRight: const Radius.circular(180),
            ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
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
