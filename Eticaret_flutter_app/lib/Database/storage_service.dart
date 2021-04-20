import 'dart:io';

//import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  /*final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  //resim ekle
  Future<String>uplodMedia(File file) async {
    var uploadTast=_firebaseStorage.ref().child(""
        "${DateTime.now().millisecondsSinceEpoch}."
        "${file.path.split('.').last}").putFile(file);
    uploadTast.events.listen((event) { });
    var storageRef=await uploadTast.onComplete;
    return await storageRef.ref.getDownloadURL();
  }*/
}
