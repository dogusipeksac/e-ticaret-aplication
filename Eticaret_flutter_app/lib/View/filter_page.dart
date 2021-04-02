import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../DesignStyle/colors_cons.dart';

//kayıt ol sayfası
class Filter extends StatelessWidget {
  static String routeName = '/routeFilter';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: themeColor,
      appBar: AppBar(
        title: Text('Filtreleme'),
        backgroundColor: background,
      ),
      body: FilterPage(),
    );
  }
}


class FilterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FilterHome(context);
  }
}

Widget FilterHome(BuildContext context) {

  final kategoriField = TextField(
    style: TextStyle(color: Colors.white,),
    cursorColor: Colors.white,
    obscureText: false,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "kategori",
        hintStyle: TextStyle(color: Colors.white),
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
    ),
  );
  final minFiyatField = TextField(
    style: TextStyle(color: Colors.white,),
    cursorColor: Colors.white,
    obscureText: false,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Minumum",
        hintStyle: TextStyle(color: Colors.white),

        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
    ),
  );
  final maxFiyatField = TextField(
    style: TextStyle(color: Colors.white),
    cursorColor: Colors.white,
    obscureText: false,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Maksimum",
        hintStyle: TextStyle(color: Colors.white),
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
    ),
  );
  final konumField = TextField(
    style: TextStyle(color: Colors.white),
    cursorColor: Colors.white,
    obscureText: false,
    decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        hintText: "Mersin",
        hintStyle: TextStyle(color: Colors.white),
        border:
        OutlineInputBorder(borderRadius: BorderRadius.circular(32.0))
    ),
  );
  final akilliSiralamaSecmeButton = Material(
    elevation: 8.0,
    borderRadius: BorderRadius.circular(1.0),
    color: background,
    // ignore: deprecated_member_use
    child: RaisedButton(
      onPressed: () {},
      child: Text("Akıllı Sıralama",
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
    ),
  );
  final filtreleButton = Material(
    elevation: 5.0,
    borderRadius: BorderRadius.circular(30.0),
    color: themeColor,
    child: MaterialButton(
      minWidth:250,
      padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
      onPressed: () {

      },


      child: Text("Filtrele",
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold),),
    ),
  );
  return Container(
    child: Padding(
      padding: EdgeInsets.all(15.0),
      child: Column(

        children: <Widget>[

         Container(
           child: Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: <Widget>[
               Text('Tüm Kategoriler',
                   style:
                   TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20)),
               SizedBox(height: 20,),
              kategoriField,

             ],
           ),
         ),
          SizedBox(height: 20,),
          Container(

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Fiyat Aralığı',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20)),
                SizedBox(height: 20,),
                Row(
                  children:<Widget> [

                    Expanded(
                        child: minFiyatField),
                    SizedBox(width: 40),
                    Expanded(child: maxFiyatField),

                  ],
                ),


              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Konum',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20)),
                SizedBox(height: 20,),
                konumField,

              ],
            ),
          ),
          SizedBox(height: 20,),
          Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text('Sırala',
                    style:
                    TextStyle(fontWeight: FontWeight.bold, color: Colors.white,fontSize: 20)),
                SizedBox(height: 20,),
                konumField,

              ],
            ),
          ),
          SizedBox(height: 40,),
         Center(child: filtreleButton),

        ],
      ),
    ),
    decoration: new BoxDecoration(
        color: background,
        borderRadius:
            new BorderRadius.only(bottomRight: const Radius.circular(180))),
  );
}
