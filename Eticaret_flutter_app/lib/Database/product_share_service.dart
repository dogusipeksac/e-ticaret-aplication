

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Entitiy/product.dart';
import 'package:flutter/material.dart';

class ProductShareService{
    final FirebaseFirestore _firestore=FirebaseFirestore.instance;


    Future<void>addProduct(String image,
        String productCategory,
        String productTitle,
        String productPrize,
        String productState,
        String productOfDescription)async{
      var ref=_firestore.collection("Product");
      var documentRef=await ref.add({
        'Image':image,
        'Kategori':productCategory,
        'Baslık':productTitle,
        'Fiyat':productPrize,
        'Durum':productState,
        'Tanim':productOfDescription,

      });
      return Product(id:documentRef.id,
          productCategory:productCategory,
          productImage:image,
          productOfDescription:productOfDescription,
          productPrice:productPrize,
          productState:productState,
          productTitle:productTitle);
    }


}