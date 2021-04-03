

import 'package:cloud_firestore/cloud_firestore.dart';

class Product {

  String id;

  //mesela çok iyi durumda
  String productState;

  //mesela 2 el sıfır gibi
  String productCategory;

  //ürün ile ilgili açıklamalar
  String productOfDescription;
  String productPrice;

  //birdenn fazla resim olacak
  String productImage;
  String productTitle;

  Product(
      {this.id, this.productCategory,
        this.productImage,
        this.productOfDescription,
        this.productPrice,
        this.productState,
        this.productTitle});




}
