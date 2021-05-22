import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Model/chat.dart';

class ChatService{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;


  Stream<List<Chat>>getConversition(String userID){
    var ref=_firestore.collection("Conversitons").
    where("members",arrayContains:userID).snapshots();
    return ref.map(
            (qShot) => qShot.docs.map(
                (doc) => Chat(
                    id: doc.id,
                    name: 'Dali',
                    productImage: 'https://i.sozcu.com.tr/wp-content/uploads/2017/02/sozcu-boeing-777-1.jpg',
                    displayMessage: doc.get('message'),
                    productTitle:'title',
                    userImage:'https://i.sozcu.com.tr'
                        '/wp-content/uploads/2017/02/sozcu-boeing-777-1.jpg'
            )
        ).toList()
    );
  }


}