import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  static final getPath = FirebaseFirestore.instance.collection("Product");
  String id;
  String userId;
  //mesela çok iyi durumda
  String productState;

  //mesela 2 el sıfır gibi
  String productCategory;

  //ürün ile ilgili açıklamalar
  String productOfDescription;
  String productPrice;

  //birdenn fazla resim olacak
  String productImage1;
  String productImage2;
  String productImage3;
  String productImage4;
  String productImage5;
  String productTitle;

  Product(
      {this.id,
        this.userId,
        this.productCategory,
        this.productImage1,
        this.productImage2,
        this.productImage3,
        this.productImage4,
        this.productImage5,
        this.productOfDescription,
        this.productPrice,
        this.productState,
        this.productTitle});

  List<String> getImages(){
    List<String> images = [
      productImage1,
      productImage2,
      productImage3,
      productImage4,
      productImage5,
    ];
    for(var i=0; i< images.length; i++ ){
      if(images.elementAt(i).isEmpty)
        images.removeRange(i, images.length);
    }
    return images;
  }

  factory Product.fromSnapshot(DocumentSnapshot snapshot){
    return Product(
      id: snapshot.id,
      userId: snapshot['User id'],
      productOfDescription: snapshot['Aciklama'],
      productTitle: snapshot['Baslik'],
      productState: snapshot['Durumu'],
      productPrice: snapshot['Fiyat'],
      productImage1: snapshot['Image 1'],
      productImage2: snapshot['Image 2'],
      productImage3: snapshot['Image 3'],
      productImage4: snapshot['Image 4'],
      productImage5: snapshot['Image 5'],
      productCategory: snapshot['Kategori'],
    );
  }

  Future<Product> fromProductId(String productId) async {
    DocumentSnapshot doc = await getPath.doc(productId).get();
    return Product.fromSnapshot(doc);
  }

}