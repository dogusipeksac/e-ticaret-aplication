import 'package:cloud_firestore/cloud_firestore.dart';

class NotificationModel{
  ///Notification firestore path
  static final getPath = FirebaseFirestore.instance.collection("Notification");

  String id;
  String productId;
  String willingId;
  String userId;
  bool isShowed;
  NotificationModel({
    this.id,
    this.productId,
    this.willingId,
    this.userId,
    this.isShowed,
  });


  Map<String,dynamic> toMap(NotificationModel model){
    return {
      'product_id': model.productId,
      'willing_id': model.willingId,
      'user_id': model.userId,
      'is_showed': model.isShowed,
    };
  }

  factory NotificationModel.fromSnapshot(DocumentSnapshot snapshot){
    return NotificationModel(
      id: snapshot.id,
      productId: snapshot['product_id'],
      willingId: snapshot['willing_id'],
      userId: snapshot['user_id'],
      isShowed: snapshot['is_showed'],
    );
  }
}