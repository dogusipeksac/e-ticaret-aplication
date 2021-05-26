import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Core/Service/notification_service.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/for_text_style.dart';
import 'package:e_ticaret_flutter_app/Model/Wish.dart';
import 'package:e_ticaret_flutter_app/Model/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WishListService{
  String uid = FirebaseAuth.instance.currentUser.uid;
  final NotificationService _notificationService= NotificationService();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Widget isInWishList(String productId,int counter,{Widget whenTrue, Widget whenFalse})  {
    print(uid);
    Stream<List<Wish>> st= Wish.getPath.where("willing_id",isEqualTo: uid)
        .where("product_id",isEqualTo: productId)
        .snapshots().map((event) => event.docs.map((doc) => Wish.fromSnapshot(doc)).toList());
    return StreamBuilder(
      stream: st,
      builder: (context,snapshot){
        if(snapshot.hasData && !snapshot.data.isEmpty)
          return Container(
            color: Colors.black45.withOpacity(0.3),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                whenTrue,
                Text(counter.toString(),style: detailTitle,),
              ],
            ),
          );
        else
          return Container(
            color: Colors.black45.withOpacity(0.3),
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                whenFalse,
                Text(counter.toString(),style: detailTitle,),
              ],
            ),
          );
      },
    );
  }

  Stream<QuerySnapshot> countOfProductWish(String productId) {
    var deger= Wish.getPath
        .where("product_id",isEqualTo: productId)
        .snapshots();
    return deger;
  }
  void addWishList(Product product) {
    _notificationService.addNotification(product,uid);
    Wish.getPath.add({
      'product_id': product.id,
      'willing_id': uid,
    });
  }
  void removeWishList(Wish wish) {
    _notificationService.removeNotification(wish.productId,uid);
    Wish.getPath.where('willing_id',isEqualTo: wish.willingId).where('product_id',isEqualTo:wish.productId)
        .get()
        .then((value) => value.docs.forEach((element) {
          Wish.getPath.doc(element.id).delete();
        }));
  }

  ///future extends maybe
  Stream<List<Wish>> getUserWishList(){
    var wishList;
    var snapshots = Wish.getPath
        .where("willing_id",isEqualTo: FirebaseAuth.instance.currentUser.uid)
        .snapshots();
    wishList = snapshots.map((qShot) => qShot.docs.map((doc) => Wish.fromSnapshot(doc)).toList());
    return wishList;
  }
}