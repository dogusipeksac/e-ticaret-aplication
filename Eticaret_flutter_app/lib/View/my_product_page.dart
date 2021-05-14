import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Core/Service/product_share_service.dart';

import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../Map/main_drawer.dart';

//bildirimler sayfasi
class MyProduct extends StatelessWidget {
  final ProductShareService service= ProductShareService();
  static String routeName = '/routeMyProduct';
  @override
  Widget build(BuildContext context) {

    Query myProduct= service.getUserProduct();

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('Ürünlerim'),
        backgroundColor: background,
      ),
      drawer: MainDrawer(),
      body: StreamBuilder<QuerySnapshot>(
        stream: myProduct.snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
          if(snapshot.hasError){
            return Text("Birşeyler yanlış gitti");
          }
          if(snapshot.connectionState==ConnectionState.waiting){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return  ListView.builder(
            padding: EdgeInsets.only(bottom:40),
            itemCount: snapshot.data.docs.length,
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
                          child: snapshot.data.docs[index]["Image 1"] == "" ?
                          Image.asset("images/Opel_KARL.jpg") : Image.network(snapshot.data.docs[index]["Image 1"]),
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
                                snapshot.data.docs[index]["Fiyat"]  + "  Türk Lirası",
                                style: TextStyle(color: themeColor, fontSize: 15),
                              ),
                              SizedBox(
                                height: 5.0,
                              ),
                              Text(
                                snapshot.data.docs[index]["Aciklama"],
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
          );
        },
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
