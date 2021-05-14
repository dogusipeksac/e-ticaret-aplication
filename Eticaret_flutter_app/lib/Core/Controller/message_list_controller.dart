

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class MessageListController{
  final String userId=FirebaseAuth.instance.currentUser.uid;
    getMessageListPath(){
    return FirebaseFirestore.instance.collection("Conversitons").
    where("members",arrayContains: userId).snapshots();
  }
}




