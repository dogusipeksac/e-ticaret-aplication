


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class UserModel {
  static final getPath = FirebaseFirestore.instance.collection("User");
  final String uid;
  final String name;
  final String email;
  final String password;
  final String userLocation;
  final String userImageLink;
  final Image userImage;

  UserModel({this.uid,
    this.name,
    this.password,
    this.email,
    this.userImage,
    this.userImageLink,
    this.userLocation});


  factory UserModel.fromSnapshot(DocumentSnapshot snapshot){

    return UserModel(
      uid: snapshot.id,
      name: snapshot['name'],
      email: snapshot['email'],
      password: snapshot['password'],
      userImage: snapshot['image'],
      userLocation: snapshot['location'],
    );
  }

  Future<UserModel> fromUserId(String userId) async{
    var sending = await getPath.doc(userId).snapshots()
        .map((snapshot)  =>  UserModel(
      uid: snapshot.id,
      name: snapshot['name'],
      userImageLink: snapshot['image'])
    ).first;
    print(sending);
    return sending;
  }
}