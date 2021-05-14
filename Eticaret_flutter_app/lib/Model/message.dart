


import 'package:cloud_firestore/cloud_firestore.dart';


class Message {
  String message;
  String senderId;
  String messageId;



  Message({this.message,this.senderId,this.messageId});

  factory Message.fromSnapshot(DocumentSnapshot  snapshot){
    return Message(
       messageId: snapshot.id,
      message: snapshot.data()['message'],

    );
  }

}