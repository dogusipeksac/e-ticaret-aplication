import 'package:e_ticaret_flutter_app/Core/Service/notification_service.dart';
import 'package:e_ticaret_flutter_app/Model/Wish.dart';
import 'package:e_ticaret_flutter_app/Model/product.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class WishListService{
  String uid = FirebaseAuth.instance.currentUser.uid;
  final NotificationService _notificationService= NotificationService();
  final FirebaseAuth auth = FirebaseAuth.instance;

  Widget isInWishList(String productId ,{Widget whenTrue, Widget whenFalse})  {
    print(uid);
    Stream<List<Wish>> st= Wish.getPath.where("willing_id",isEqualTo: uid)
        .where("product_id",isEqualTo: productId)
        .snapshots().map((event) => event.docs.map((doc) => Wish.fromSnapshot(doc)).toList());
    return StreamBuilder(
      stream: st,
      builder: (context,snapshot){
        if(snapshot.hasData && !snapshot.data.isEmpty)
          return whenTrue;
        else
          return whenFalse;
      },
    );
  }

  Future<int> countOfProductWish(String productId) async{
    return await Wish.getPath
        .where("product_id",isEqualTo: productId)
        .snapshots().length;
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