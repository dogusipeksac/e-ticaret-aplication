
import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:e_ticaret_flutter_app/Model/chat.dart';
import 'package:e_ticaret_flutter_app/View/message_detail.dart';
import 'package:e_ticaret_flutter_app/ViewModal/chats_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get_it/get_it.dart';
import 'package:provider/provider.dart';

import '../Map/main_drawer.dart';

//bildirimler sayfasi
class MessageList extends StatelessWidget {
  String userID=FirebaseAuth.instance.currentUser.uid;
  static String routeName = '/routeMessageList';
  @override
  Widget build(BuildContext context) {
    var model=GetIt.instance<ChatsModel>();

    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('Mesajlar-Hepsi'),
        backgroundColor: background,
      ),
      drawer: MainDrawer(),
      body: ChangeNotifierProvider(
        //memory optimizasyonu
        create: (BuildContext context)=>model,
        child: StreamBuilder<List<Chat>>(
          stream:model.conservation(userID),
          builder:(BuildContext context,AsyncSnapshot<List<Chat>> snapshot){
            if(snapshot.hasError){
              return Text("Eror: ${snapshot.error}");
            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return Text('Loading..');
            }
            return ListView(
              children: snapshot.data.
              map((doc)=> Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder:
                        ((context)=>
                            MessageDetail(
                              userId:FirebaseAuth.instance.currentUser.uid,
                              conservationId: doc.id,))));
                      print(doc.id);

                    },
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
                                        doc.productImage),
                                  ),
                                  width: 20,
                                  height: 20,
                                  color: Colors.transparent,
                                  margin: EdgeInsets.only(left: 40, top: 30),
                                ),
                                backgroundColor: filterBackground,
                                foregroundColor: filterBackground,
                                backgroundImage: NetworkImage(
                                    doc.userImage),
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
                                  doc.productTitle,
                                  style: TextStyle(color: themeColor, fontSize: 15),
                                ),
                                Text(
                                 doc.name,
                                  style: TextStyle(color: Colors.white, fontSize: 15),
                                ),
                                SizedBox(
                                  height: 2,
                                ),
                                Text(
                                  doc.displayMessage,
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
              )).toList(),
            );
          },
        ),
      ),
    );
  }
}
