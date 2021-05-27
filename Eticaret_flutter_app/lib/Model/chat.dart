import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  String id;

  String productId;
  String productImage;
  String productPrize;
  String title;
  String productUserImage;
  String productUserName;
  String productUserId;
  String message;


  Chat(
      {this.id,
      this.productId,
      this.productImage,
      this.productPrize,
      this.productUserImage,
      this.productUserName,
      this.title,
        this.productUserId,
        this.message
      });
}
