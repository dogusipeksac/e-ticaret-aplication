import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/widgets.dart';

class User {
  final String uid;
  final String name;
  final String email;
  final String password;
  final String userLocation;
  final Image userImage;

 User({this.uid,
   this.name,
   this.password,
   this.email,
   this.userImage,
   this.userLocation});


 factory User.fromSnapshot(DocumentSnapshot snapshot){
   return User(
     uid: snapshot.id,
     name: snapshot['name'],
     email: snapshot['email'],
     password: snapshot['password'],
     userImage: snapshot['image'],
     userLocation: snapshot['location'],
   );
 }
}