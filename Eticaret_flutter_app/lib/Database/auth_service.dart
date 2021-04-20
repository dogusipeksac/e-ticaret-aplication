import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService{
    final FirebaseAuth _auth=FirebaseAuth.instance;
    final FirebaseFirestore _firebaseFirestore=FirebaseFirestore.instance;
    //defalt degerler
    String location='Adana Ülkesi';
    String imageAdress='https://i.tmgrup.com.tr/gq/img/920x615/17-06/22/user_male_circle_filled1600.png';


    Future<User> signIn(String email,String password) async{
      var user=await _auth.signInWithEmailAndPassword(email: email, password: password);
      return user.user;
    }
    //çıkış yap
    signOut() async{
      return await _auth.signOut();
    }

    Future<User> createPerson(String email,
        String name,
        String password,
        ) async {
      var user=await _auth.createUserWithEmailAndPassword(email: email, password: password);
      await _firebaseFirestore.collection("User").doc(user.user.uid).set(
        {
          'name'  : name,
          'email' : email,
          'password':password,
          'location':location,
          'image': imageAdress,
        }
      );
      return user.user;

    }

}