import 'package:flutter/material.dart';
class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller();

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              CategoryCard(CategoryName: "Most\nFavorites", CountOfProduct: "20 Items"),
              CategoryCard(CategoryName: "Newest", CountOfProduct: "20 Items"),
              CategoryCard(CategoryName: "Super\nSaving", CountOfProduct: "20Items"),
            ],
          ),
        ),
      ),
    );
  }
}

//Colors.blue.shade400 Colors.lightBlueAccent.shade400 Colors.orange.shade400
class CategoryCard extends StatelessWidget {
  final String CategoryName;
  final String CountOfProduct;
  CategoryCard({
    @required this.CategoryName,
    @required this.CountOfProduct
  });
  @override
  Widget build(BuildContext context) {
    final double categoryHeight = MediaQuery.of(context).size.height * 0.30 - 50;

    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 20),
      height: categoryHeight,
      decoration: BoxDecoration(color: Colors.orange.shade400, borderRadius: BorderRadius.all(Radius.circular(20.0))),
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                this.CategoryName,
                style: TextStyle(fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                this.CountOfProduct,
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
