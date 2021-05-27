import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Core/Service/message_service.dart';
import 'package:e_ticaret_flutter_app/Model/chat.dart';
import 'package:e_ticaret_flutter_app/Model/product.dart';
import 'package:e_ticaret_flutter_app/Model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  MessageService _service = MessageService();

  Stream<List<Chat>> getConversition(String userId) {
    var ref = _firestore
        .collection("Conversitons")
        .where("members", arrayContains: userId);
    return ref.snapshots().map((qShot) => qShot.docs
        .map((doc) => Chat(
        id: doc.id,
        title: doc.get('title'),
        productId: doc.get('productId'),
        productImage: doc.get('productImage'),
        productPrize: doc.get('productPrize'),
        productUserImage: doc.get('userImage'),
        productUserName: doc.get('userName'),
        productUserId: doc.get('productUserId')
    ))
        .toList());
  }

  Future<String> chatStart(
      Product product, String userId, String message) async {
    //ürün sahibinni bilgilerini çekme için
    UserModel sellerProduct = await UserModel().fromUserId(product.userId);
    var doc;
    var startConversitns = _firestore.collection("Conversitons");
    doc = await startConversitns.add({
      //
      'members': FieldValue.arrayUnion([product.userId, userId]),
      //
      'title': product.productTitle,
      'productImage': product.productImage1,
      'userName': sellerProduct.name,
      'userImage': sellerProduct.userImageLink,
      'productPrize': product.productPrice,
      'productUserId':product.userId,
      //
      'productId': product.id,
      //

    });
    _service.addMessage(message, userId, doc.id);

    return doc.id;
  }

  Future<String> productConversitonsExist(
      String productId, String userId) async {
    var query = (await FirebaseFirestore.instance
        .collection("Conversitons")
        .where("productId", isEqualTo: productId)
        .where("members", arrayContains: userId)
        .get())
        .docs;
    print("Query result:" + query.toString());
    print("productId:" + productId);

    return query.length > 0 ? query.first.id : null;
  }
}
