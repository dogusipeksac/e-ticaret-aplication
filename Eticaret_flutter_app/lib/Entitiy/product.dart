
import 'dart:ui';

class Product{
  //mesela çok iyi durumda
  String _productState;
  //mesela 2 el sıfır gibi
  String _productCategory;
  //ürün ile ilgili açıklamalar
  String _productOfDescription;
  int _productPrice;
  //birdenn fazla resim olacak
  Image _productImage;
  String _productTitle;

  Product(this._productState, this._productCategory, this._productOfDescription,
      this._productPrice, this._productImage, this._productTitle);



  String get productTitle => _productTitle;

  set productTitle(String value) {
    _productTitle = value;
  }

  Image get productImage => _productImage;

  set productImage(Image value) {
    _productImage = value;
  }

  int get productPrice => _productPrice;

  set productPrice(int value) {
    _productPrice = value;
  }

  String get productOfDescription => _productOfDescription;

  set productOfDescription(String value) {
    _productOfDescription = value;
  }

  String get productCategory => _productCategory;

  set productCategory(String value) {
    _productCategory = value;
  }

  String get productState => _productState;

  set productState(String value) {
    _productState = value;
  }
}