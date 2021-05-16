import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Model/message.dart';
import 'package:firebase_auth/firebase_auth.dart';

class MessageService{
  Message message = Message();
  String status = 'Online';
  String productName = '2034 Opel Corsa Hataasız';
  String productPrices = '47.000 TL';
  String productImage = 'https://images4.alphacoders.com/880/880948.jpg';
  String profileImage =
      'https://cdn.pixabay.com/photo/2017/01/31/21/23/avatar-2027366_1280.png';
  String nameSurname = 'Bünyamin Ertaş';


  FirebaseFirestore _firestore=FirebaseFirestore.instance;
  Stream<List<Message>> getMessage(String conservationId) {
    var stream =
    _firestore.
    collection("Conversitons/${conservationId}/Messages").
    orderBy('timeStamp').snapshots();

    return stream.map(
            (qShot) => qShot.docs.map(
                (doc) => Message(
              message: doc.get('message'),
              senderId: doc.get('senderId'),
            )
        ).toList()
    );
  }

  final String userId=FirebaseAuth.instance.currentUser.uid;
  getMessageListPath(){
    return FirebaseFirestore.instance.collection("Conversitons").
    where("members",arrayContains: userId).snapshots();
  }


/*//veri ekleme fonksiyonu
  Future<void> addMessage(
      String message,
      String senderId,
      ) async {



    var documentRef = await _ref.add({
      'message': message,
      'senderId': senderId,
    });
    return Message(
        messageId: documentRef.id,
        message: message,
        senderId: senderId);
  }*/


}