import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_ticaret_flutter_app/Core/Controller/user_controller.dart';
import 'package:e_ticaret_flutter_app/Core/Service/auth_service.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:e_ticaret_flutter_app/View/home_page.dart';
import 'package:e_ticaret_flutter_app/View/message_list_page.dart';
import 'package:e_ticaret_flutter_app/View/my_product_page.dart';
import 'package:e_ticaret_flutter_app/View/notifications_page.dart';
import 'package:e_ticaret_flutter_app/View/setting_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';


class MainDrawer extends StatelessWidget {
  final UserController _userController=UserController();

  Future<void> _signOut(BuildContext context) async {
    try {
      final auth = Provider.of<AuthService>(context, listen: false);
      await auth.signOut();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 3,
      child: StreamBuilder<DocumentSnapshot>(
        stream: _userController.getPath().snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot){
          if (snapshot.hasError) {
            return Text("Birşeyler yanlış gitti");
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return Column(
            children: <Widget>[
              SafeArea(
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(20),
                  color: themeColor,
                  child: Center(
                    child: Row(
                      children: <Widget>[
                        Material(
                          borderRadius: BorderRadius.all(Radius.circular(180)),
                          color: text,
                          elevation: 20,
                          child: CircleAvatar(
                            radius: 40,
                            backgroundColor: Colors.transparent,
                            child: ClipOval(
                              child: Image(
                                image: snapshot.data['image'] =="" ?
                                   AssetImage("images/profile.png",)
                                    :NetworkImage(
                                    snapshot.data['image']),
                              ),
                            ),
                          ),
                        ),
                        Center(
                          child: Container(
                            padding: const EdgeInsets.only(left: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  snapshot.data['name'],
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: 'Tienne',
                                    fontWeight: FontWeight.bold,
                                    color: text,
                                  ),
                                ),
                                IconTheme(
                                  data: IconThemeData(
                                    color: Colors.deepOrange,
                                    size: 20,
                                  ),
                                  child: StarDisplay(value: 3),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top:8.0),
                                  child: Text(
                                    '19 Ürün',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontFamily: 'Tienne',
                                      color: text,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: background,
                  child: Column(
                    children: <Widget>[
                      /** Main Page **/
                      Divider(
                        color: Colors.transparent,
                        height: 20,
                      ),
                      ListTile(
                        title: Text('Anasayfa',
                          style: TextStyle(
                              color: text,
                              fontSize: 30,
                              fontWeight: FontWeight.normal,
                              fontFamily: 'Tienne'),
                        ),
                        onTap: () {
                          Navigator.pushNamed(context, HomePage.routeName);
                        },
                      ),
                      Container(
                        width: 280,
                        child: Divider(
                          color: filterBackground,
                          thickness: 2,
                          height: 3,
                        ),
                      ),
                      /** Notification **/
                      Divider(
                        color: Colors.transparent,
                        height: 20,
                      ),
                      ListTile(
                        title: Text('Bildirimler',
                            style: TextStyle(
                                color: text,
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Tienne')),
                        onTap: () {
                          Navigator.pushNamed(context, Notifications.routeName);
                        },
                      ),
                      Container(
                        width: 280,
                        child: Divider(
                          color: filterBackground,
                          thickness: 2,
                          height: 3,
                        ),
                      ),
                      /** Messages **/
                      Divider(
                        color: Colors.transparent,
                        height: 20,
                      ),
                      ListTile(
                        title: Text('Mesajlar',
                            style: TextStyle(
                                color: text,
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Tienne')),
                        onTap: () {
                          Navigator.pushNamed(context, MessageList.routeName);
                        },
                      ),
                      Container(
                        width: 280,
                        child: Divider(
                          color: filterBackground,
                          thickness: 2,
                          height: 3,
                        ),
                      ),
                      /** My Products **/
                      Divider(
                        color: Colors.transparent,
                        height: 20,
                      ),
                      ListTile(
                        title: Text('Ürünlerim',
                            style: TextStyle(
                                color: text,
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Tienne')),
                        onTap: () {
                          Navigator.pushNamed(context, MyProduct.routeName);
                        },
                      ),
                      Container(
                        width: 280,
                        child: Divider(
                          color: filterBackground,
                          thickness: 2,
                          height: 3,
                        ),
                      ),
                      /** Settings **/
                      Divider(
                        color: Colors.transparent,
                        height: 20,
                      ),
                      ListTile(
                        title: Text('Ayarlar',
                            style: TextStyle(
                                color: text,
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Tienne')),
                        onTap: () {
                          Navigator.pushNamed(context, SettingPage.routeName);
                        },
                      ),
                      Container(
                        width: 280,
                        child: Divider(
                          color: filterBackground,
                          thickness: 2,
                          height: 3,
                        ),
                      ),
                      /** Log out **/
                      Divider(
                        color: Colors.transparent,
                        height: 20,
                      ),
                      ListTile(
                        title: Text('Çıkış',
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 30,
                                fontWeight: FontWeight.normal,
                                fontFamily: 'Tienne')),
                        onTap: () =>_signOut(context),
                      ),
                      Container(
                        width: 280,
                        child: Divider(
                          color: filterBackground,
                          thickness: 2,
                          height: 3,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        }

      ),
    );
  }
}
//class for rating with star
class StarDisplay extends StatelessWidget {
  final int value;
  const StarDisplay({Key key, this.value = 0})
      : assert(value != null),
        super(key: key);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < value ? Icons.star : Icons.star_border,
        );
      }),
    );
  }
}