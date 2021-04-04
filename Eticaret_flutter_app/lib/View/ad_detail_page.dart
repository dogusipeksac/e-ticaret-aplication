import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';

class AdDetail extends StatefulWidget {
  static String routeName = '/routeAdDetailPage';

  @override
  _AdDetailState createState() => _AdDetailState();
}

class _AdDetailState extends State<AdDetail> {
  PageController pageController;
  int current_photo;
  String product = "2034 Opel Corsa";
  String price = "43.500 TL";
  String info =
      "Araç temizdir boya değişen yok.\n Hasar kaydı temiz,\n 25.000 Km \n Memurdan "
      "\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\n|\nV";
  List<String> images = [
    'https://www.torcanrentacar.com/upload/resimler/araba/yeni%20renault%20symbol.jpg',
    'https://i0.shbdn.com/photos/11/34/85/x5_337113485uf1.jpg',
    'https://www.thestreet.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTY4NTE2OTEyNjk4NDM1MzUw/the-best-cars-to-buy-used.jpg',
    'https://images4.alphacoders.com/880/880948.jpg'
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 1);
    current_photo = pageController.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    final _pageView = SizedBox(
      height: MediaQuery.of(context).size.height/2,
      width: MediaQuery.of(context).size.width,
      child: Stack(
        children: [
          PageView.builder(
            pageSnapping: true,
            controller: pageController,
            itemCount: images.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, position) {
              return imageSlider(position);
            },
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SelectedPhoto(
              numberOfDots: images.length,
              photoIndex: current_photo,
            ),
          ),
        ],
      ),
    );
    final _productDetail = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 15.0, left: 15),
          child: Text(
            price,
            style: TextStyle(
              color: themeColor,
              fontSize: 30,
              fontFamily: "Tienne",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5, left: 15),
          child: Text(
            product,
            style: TextStyle(
              color: text,
              fontSize: 25,
              fontFamily: "Tienne",
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            "Açıklama :",
            style: TextStyle(
              fontSize: 19,
              fontFamily: "Tienne",
              fontWeight: FontWeight.bold,
              color: text,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15),
          child: Text(
            info,
            style: TextStyle(
              fontSize: 19,
              fontFamily: "Tienne",
              color: text,
            ),
          ),
        ),
      ],
    );
    return Scaffold(
      backgroundColor: background,
      bottomNavigationBar: BottomAppBar(
        color: filterBackground,
        child: Row(
          children: [
            Spacer(),
            ElevatedButton(
              onPressed: () {},
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Text(
                  "Mesaj At",
                  style: TextStyle(
                      color: background, fontSize: 20, fontFamily: 'Tienne'),
                ),
              ),
              style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  primary: themeColor,
                  elevation: 10),
            ),
            Spacer(),
            ElevatedButton(
                onPressed: () {},
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 3, horizontal: 30),
                  child: Text(
                    "Ara",
                    style: TextStyle(
                        color: background, fontSize: 20, fontFamily: 'Tienne'),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  primary: themeColor,
                  elevation: 10,
                )),
            Spacer(),
          ],
        ),
      ),
      body: Container(
        child: ListView(
          shrinkWrap: true,
          children: [
            _pageView,
            _productDetail,
          ],
        ),
      ),
    );
  }

  _onPageChanged(int page) {
    setState(() {
      current_photo = page;
    });
  }

  imageSlider(int index) {
    return Container(
      width: double.maxFinite,
      height: double.maxFinite,
      child: FittedBox(
        fit: BoxFit.fill,
        child: Image.network(
          images[index],
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

class SelectedPhoto extends StatelessWidget {
  final int numberOfDots;
  final int photoIndex;
  const SelectedPhoto({this.numberOfDots, this.photoIndex});

  Widget _inactivePhoto() {
    return new Container(
      child: new Padding(
        padding: const EdgeInsets.only(left: 3, right: 3),
        child: Container(
          height: 10.0,
          width: 10.0,
          decoration: BoxDecoration(
              color: Colors.black, borderRadius: BorderRadius.circular(10.0)),
        ),
      ),
    );
  }

  Widget _activePhoto() {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(left: 5.0, right: 5.0),
        child: Container(
          height: 15.0,
          width: 15.0,
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.black, width: 2),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey, spreadRadius: 0.0, blurRadius: 2.0)
              ]),
        ),
      ),
    );
  }

  List<Widget> _buildDots() {
    List<Widget> dots = [];
    for (int i = 0; i < numberOfDots; ++i) {
      dots.add(i == photoIndex ? _activePhoto() : _inactivePhoto());
    }
    dots.add(Padding(
      padding: const EdgeInsets.only(left: 4.0),
      child: Text(
        "${photoIndex+1}/$numberOfDots",
        style: TextStyle(color: Colors.black, fontSize: 20),
      ),
    ));
    return dots;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 30.0, bottom: 20.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: _buildDots(),
      ),
    );
  }
}
