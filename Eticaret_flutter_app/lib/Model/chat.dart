
import 'package:cloud_firestore/cloud_firestore.dart';


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



}