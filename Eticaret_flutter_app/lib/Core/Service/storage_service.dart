import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;

  Future<FirebaseStorage> uploadFile(File file) async {
    var uploadTask = _firebaseStorage
        .ref()
        .child(
        "${DateTime.now().millisecondsSinceEpoch.toString()}.${file.path.split(".").last}")
        .putFile(file);

    uploadTask.snapshotEvents.listen((event) {
      print(event);
    });

    var snapShot = null/*await uploadTask.onComplete*/;

    return snapShot.ref;
  }
}
