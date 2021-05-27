import 'package:cloud_firestore/cloud_firestore.dart';

class Chat {
  String id;

  String productId;
  String productImage;
  String productPrize;
  String title;
  String productUserId;
  String message;
  List<String> members;
  String senderImage;
  String senderName;
  String receiverImage;
  String receiverName;

  Chat({
    this.id,
    this.productId,
    this.productImage,
    this.productPrize,
    this.title,
    this.productUserId,
    this.message,
    this.members,
    this.receiverImage,
    this.receiverName,
    this.senderImage,
    this.senderName,
  });
}
