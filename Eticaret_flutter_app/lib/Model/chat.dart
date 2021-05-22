
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Model/product.dart';
import 'package:e_ticaret_flutter_app/Model/user.dart';


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

/*

  factory Chat.fromSnapshot(
      DocumentSnapshot snapshot, User otherUser,Product product) {
    return Chat(
     id: snapshot.id,
      displayMessage: snapshot.data()['displayMessage'],
      productTitle: product.productTitle,
      userImage: otherUser.userImage.toString(),
      name: otherUser.name,
      productImage: product.productImage1,

    );

  }*/

}