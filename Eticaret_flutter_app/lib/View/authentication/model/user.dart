


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
}