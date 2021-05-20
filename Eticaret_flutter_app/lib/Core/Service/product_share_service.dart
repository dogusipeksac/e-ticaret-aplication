import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Model/product.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ProductShareService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  final FirebaseAuth auth = FirebaseAuth.instance;

//veri ekleme fonksiyonu
  Future<void> addProduct(
      String userId,
      String pickedFile1,
      String pickedFile2,
      String pickedFile3,
      String pickedFile4,
      String pickedFile5,
      String productCategory,
      String productTitle,
      String productPrize,
      String productState,
      String productOfDescription) async {
    var ref = _firestore.collection("Product");

    var documentRef = await ref.add({
      'User id': userId,
      'Image 1': pickedFile1,
      'Image 2': pickedFile2,
      'Image 3': pickedFile3,
      'Image 4': pickedFile4,
      'Image 5': pickedFile5,
      'Kategori': productCategory,
      'Baslik': productTitle,
      'Fiyat': productPrize,
      'Durumu': productState,
      'Aciklama': productOfDescription,
    });
    return Product(
        id: documentRef.id,
        userId: userId,
        productImage1: pickedFile1,
        productImage2: pickedFile2,
        productImage3: pickedFile3,
        productImage4: pickedFile4,
        productImage5: pickedFile5,
        productCategory: productCategory,
        productOfDescription: productOfDescription,
        productPrice: productPrize,
        productState: productState,
        productTitle: productTitle);
  }


  Query getUserProduct(){
    return FirebaseFirestore.instance.collection("Product").
    where("User id",isEqualTo: FirebaseAuth.instance.currentUser.uid);
  }

  Stream<List<Product>> getProduct() {
    var stream =
    _firestore.collection('Product').snapshots();
    return stream.map(
            (qShot) => qShot.docs.map(
                (doc) => Product.fromSnapshot(doc)
        ).toList()
    );
  }



  //silme
  Future<void> remove(String docId) {
    var ref = _firestore.collection("Product").doc(docId).delete();
    return ref;
  }
}