import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
/*
  User _userFromFirebaseUser(FirebaseUser user){
    return user !=null? User(uid: user.uid) :null;

  }

  //sign in anonim




//auth change user stream
  Stream<User> get user{
    return _auth.onAuthStateChanged
    //.map((FirebaseUser user) => _userFromFirebaseUser(user));
    .map(_userFromFirebaseUser) ;
  }
*/




  final FirebaseAuth _auth=FirebaseAuth.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  //defalt degerler
  String location = 'Adana Ülkesi';
  String imageAdress =
      'https://i.tmgrup.com.tr/gq/img/920x615/17-06/22/user_male_circle_filled1600.png';

  Stream<User> get authStateChanges => _auth.authStateChanges()
      .map((event) {
        var val = event == null? null : event;
        return val;
      });



  Future<bool> signIn(String email, String password) async {
    try{
      await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      return true;

    }catch(e){
        return false;
    }


  }

  //çıkış yap
  Future<void> signOut() async {
    return await _auth.signOut();
  }
//kayıt ol

  Future<User> createPerson(
    String email,
    String name,
    String password,
  ) async {

      var user = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      await _firebaseFirestore.collection("User").doc(user.user.uid).set({
        'name': name,
        'email': email,
        'password': password,
        'location': location,
        'image': imageAdress,
      });
      return user.user;

  }
}
