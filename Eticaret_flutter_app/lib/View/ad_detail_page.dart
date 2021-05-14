
import 'package:e_ticaret_flutter_app/Model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';

class AdDetail extends StatefulWidget {
  static String routeName = '/routeAdDetailPage';
  final Product snapshot;

  const AdDetail({@required this.snapshot});


  @override
  _AdDetailState createState() => _AdDetailState(
      product: snapshot.productTitle,
      info: snapshot.productOfDescription,
      price: snapshot.productPrice,
      images: snapshot.getImages()
  );
}

class _AdDetailState extends State<AdDetail> {
  PageController pageController;
  int current_photo;
  _AdDetailState({
    @required this.product,
    @required this.price,
    @required this.info,
    @required this.images,
  });
  final String product;
  final String price;
  final String info;
  final List<String> images;

  /*List<String> images = [
    'https://www.torcanrentacar.com/upload/resimler/araba/yeni%20renault%20symbol.jpg',
    'https://i0.shbdn.com/photos/11/34/85/x5_337113485uf1.jpg',
    'https://www.thestreet.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cfl_progressive%2Cq_auto:good%2Cw_1200/MTY4NTE2OTEyNjk4NDM1MzUw/the-best-cars-to-buy-used.jpg',
    'https://images4.alphacoders.com/880/880948.jpg'
  ];*/

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController(initialPage: 0, viewportFraction: 1);
    current_photo = pageController.initialPage;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    final _pageView = SizedBox(
      height: size.height/2,
      width: size.width,
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
          Align(
            alignment: Alignment.topRight,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(
                  Icons.arrow_back,
                  color: themeColor,
                  size: 40,
                ),
              ),
            ),
          ),
        ],
      ),
    );
    final _productDetail =Column(
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
              onPressed: ()=>showInformationDialog(context),
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
      body: Column(
        children: [
          _pageView,
          Expanded(
            child: ListView(
              children: [
                _productDetail
              ],
            ),
          ),
        ],
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

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  Future<void> showInformationDialog(BuildContext context) async {
    return await showDialog(context: context,
      builder: (context){
        final TextEditingController _textEditingController = TextEditingController();
        Widget getButton(String text){
          return ButtonTheme(
            minWidth: double.infinity,
            height: 50,
            buttonColor: themeColor,
            child: RaisedButton(
              onPressed: () {},
              elevation: 3,
              child: Text(text,style: TextStyle(color: background, fontSize: 20),),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            ),
          );
        }
        OutlineInputBorder border = OutlineInputBorder(
          borderRadius: BorderRadius.circular(13),
          borderSide: BorderSide(
            width:2,
            color: themeColor,),
        );
        return StatefulBuilder(builder: (context,setState){
          return AlertDialog(
            scrollable: true,
            title: Center(child: Text("Mesaj Gönder",style: TextStyle(color:Colors.white),)),
            backgroundColor: background,
            content: Form(
              key: _formKey,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  getButton("Hala satılık mı?"),
                  SizedBox(height: 10,),
                  getButton("Pazarlık var mı?"),
                  SizedBox(height: 10,),
                  getButton("Ne zaman alabilirim?"),
                  SizedBox(height: 10,),
                  getButton("Sorunu var mı?"),
                  SizedBox(height: 10,),
                  TextFormField(
                    controller: _textEditingController,
                    style: TextStyle(color: themeColor),
                    validator: (value){
                      return value.isNotEmpty ? null : "Invalid Field";
                    },
                    decoration: InputDecoration(
                      labelText: "Keni Mesajını Yaz",
                      labelStyle: TextStyle(color: themeColor),
                      suffixIcon: IconButton(
                        icon: Icon(Icons.send_outlined,color: themeColor,),
                        onPressed: () => print("gönderdii!"),
                      ),
                      enabledBorder: border,
                      focusedBorder: border,
                    ),
                  )
                ],
              ),
            ),
          );
        });
      },
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