import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Model/chat.dart';
import 'package:e_ticaret_flutter_app/Model/message.dart';

class ChatService{
  final FirebaseFirestore _firestore=FirebaseFirestore.instance;

  Stream<List<Chat>>getConversition(String userID){
    var ref=_firestore.collection("Conversitons").
    where("members",arrayContains: userID).snapshots();
    return ref.map((list)=>
        list.docs.map((snapshot)=>Chat.fromSnapshot(snapshot)).toList());
  }
}