import 'package:cloud_firestore/cloud_firestore.dart';

class Wish{
  static final getPath = FirebaseFirestore.instance.collection("WishList");

  String id;
  String productId;
  String willingId;
  Wish({
    this.id,
    this.productId,
    this.willingId,
  });

  factory Wish.fromSnapshot(DocumentSnapshot snapshot){
    return Wish(
      id: snapshot.id,
      productId: snapshot['product_id'],
      willingId: snapshot['willing_id'],
    );
  }

}