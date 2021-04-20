
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Database/storage_service.dart';
import 'package:e_ticaret_flutter_app/Entitiy/product.dart';
import 'package:image_picker/image_picker.dart';

class ProductShareService{
    final FirebaseFirestore _firestore=FirebaseFirestore.instance;
    StorageService _storageService=StorageService();
    String mediaUrl="";

    Future<void>addProduct(PickedFile image,
        String productCategory,
        String productTitle,
        String productPrize,
        String productState,
        String productOfDescription)async{
      var ref=_firestore.collection("Product");
      if(image==null){
          mediaUrl='';
      }
      else{

       // mediaUrl=await _storageService.uplodMedia(File(image.path));

      }

      var documentRef=await ref.add({
        'Image':mediaUrl,
        'Kategori':productCategory,
        'Baslık':productTitle,
        'Fiyat':productPrize,
        'Durum':productState,
        'Tanim':productOfDescription,

      });
      return Product(id:documentRef.id,
          productCategory:productCategory,
          productImage:mediaUrl,
          productOfDescription:productOfDescription,
          productPrice:productPrize,
          productState:productState,
          productTitle:productTitle);
    }


}