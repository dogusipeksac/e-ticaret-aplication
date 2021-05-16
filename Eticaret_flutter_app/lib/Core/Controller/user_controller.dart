import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Model/user.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserController{

  final auth = FirebaseAuth.instance;
  final _firebaseFirestore=FirebaseFirestore.instance;
  //profil update
  Future<void>updateUser(
      String userId,
      String location,
      String name,
      String password,
      String imageAdress
      ) async {
    await _firebaseFirestore.collection("User").doc(userId).update({
      'name': name,
      'password': password,
      'location': location,
      'image': imageAdress,
    });
  }

  getPath(){
    return _firebaseFirestore.collection('User').doc('${auth.currentUser.uid}');
  }
}