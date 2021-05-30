
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Model/product.dart';

class FilteredArgClass {
  static const String SORT_PRIVATE = "Sort";
  static const String SORT_DECRAESE = "SortDecraese";
  static const String SORT_INCREASE = "SortIncrease";
  String category;
  double priceMin;
  double priceMax;
  String location;
  bool sort = false;
  bool sortDecraese = false;
  bool sortIncrease = false;

  FilteredArgClass({
    this.category,
    this.priceMin,
    this.priceMax,
    this.location,
  });

  FilteredArgClass setSort(String type) {
    switch (type) {
      case (SORT_PRIVATE):
        {
          this.sort = true;
          this.sortDecraese = false;
          this.sortIncrease = false;
        }
        break;
      case (SORT_INCREASE):
        {
          this.sort = false;
          this.sortDecraese = false;
          this.sortIncrease = true;
        }
        break;
      case (SORT_DECRAESE):
        {
          this.sort = false;
          this.sortDecraese = true;
          this.sortIncrease = false;
        }
        break;
      default:
        {
          this.sort = false;
          this.sortDecraese = false;
          this.sortIncrease = false;
        }
        break;
    }
    return this;
  }

  Query buildQuery() {
    Query query = Product.getPath;
    ///category
    if (this.category != null)
      query = query.where("Kategori", isEqualTo: this.category);

    ///Location
    if (this.location != null) query = query.where("Konum",isEqualTo: this.location);

    ///Price
    if (this.priceMax != null || this.priceMin != null) {
      if (this.priceMax == null) {
        query = query.where("Fiyat", isGreaterThanOrEqualTo: this.priceMin);
      }
      else if (this.priceMin == null) {
        query = query.where("Fiyat", isLessThanOrEqualTo: this.priceMin);
      }
      else {
        query = query
            .where("Fiyat", isGreaterThanOrEqualTo: this.priceMin , isLessThanOrEqualTo: this.priceMax);
      }
    }
    ///Sort
    if (this.sort) query = query.orderBy("User id");
    else if (this.sortIncrease) query = query.orderBy("Fiyat");
    else if (this.sortDecraese) query = query.orderBy("Fiyat",descending: true);
    /*Query sabit = Product.getPath.where("Fiyat",isGreaterThan: 100).where("Konum",isEqualTo: "İstanbul");
    return sabit;*/
    return query == Product.getPath ? null : query;

  }

  get getSort{
    return sort ? SORT_PRIVATE
        : sortDecraese ? SORT_DECRAESE
        : sortIncrease ? SORT_INCREASE
        : "";
  }

  @override
  String toString() {
    return 'FilteredArgClass{category: $category, priceMin: $priceMin, priceMax: $priceMax, location: $location, sort: $sort, sortDecraese: $sortDecraese, sortIncrease: $sortIncrease}';
  }
}
