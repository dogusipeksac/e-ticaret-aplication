import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Model/message.dart';


class MessageService{
  Message message = Message();



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
              receiverId: doc.get('receiver'),
              messageId: doc.id,
            )
        ).toList()
    );
  }

  addMessage(String message,String userId,String conservationId,String receiver)async{
    var _ref=_firestore
        .collection("Conversitons/${conservationId}/Messages");
    _ref.add({
      'message': message,
      'senderId': userId,
      'timeStamp': DateTime.now(),
      'receiver':receiver,
    });
  }


  getConversitonsPath(String conversitonsId){
    return _firestore.collection('Conversitons').doc(conversitonsId).snapshots();
  }




}
