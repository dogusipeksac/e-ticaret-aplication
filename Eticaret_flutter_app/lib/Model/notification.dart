import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel{
  static final getPath = FirebaseFirestore.instance.collection("Notification");
  String id;
  String productId;
  String willingId;
  String willingName;
  String willingImage;
  String userId;
  bool isShowed;
  NotificationModel({
    this.id,
    this.productId,
    this.willingId,
    this.willingName,
    this.willingImage,
    this.userId,
    this.isShowed,
  });

  factory NotificationModel.fromSnapshot(DocumentSnapshot snapshot){
    return NotificationModel(
      id: snapshot.id,
      productId: snapshot['product_id'],
      willingId: snapshot['willing_id'],
      willingName: snapshot['willing_name'],
      willingImage: snapshot['willing_image'],
      userId: snapshot['user_id'],
      isShowed: snapshot['is_showed'],
    );
  }

  ///Notification firestore path

}