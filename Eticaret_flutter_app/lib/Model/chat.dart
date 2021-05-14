


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

import 'message.dart';

class Chat {
  String id;
  String displayMessage;
  String name;
  String productImage;
  String userImage;
  String productTitle;


  Chat({this.id,
    this.displayMessage,
    this.name,
    this.productImage,
    this.productTitle,
    this.userImage});
  factory Chat.fromSnapshot(DocumentSnapshot  snapshot){
    return Chat(
        id: snapshot.id,
        name: 'Dali',
        productImage: 'https://i.sozcu.com.tr/wp-content/uploads/2017/02/sozcu-boeing-777-1.jpg',
        displayMessage: snapshot.data()['displayMessage'],
        productTitle:'title',
        userImage:'https://i.sozcu.com.tr/wp-content/uploads/2017/02/sozcu-boeing-777-1.jpg'

    );
  }


}