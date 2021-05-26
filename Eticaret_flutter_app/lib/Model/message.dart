import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  String message;
  String senderId;
  String messageId;
  String receiverId;


  Message(
      {this.message,
      this.senderId,
      this.messageId,this.receiverId});

  factory Message.fromSnapshot(DocumentSnapshot snapshot) {
    return Message(
        messageId: snapshot.id,
        message: snapshot.data()['message'],
        senderId: snapshot.data()['senderId'],
        receiverId: snapshot.data()['receiver'],
    );
  }
}
