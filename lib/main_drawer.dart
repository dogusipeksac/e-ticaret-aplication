
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'for_text_style.dart';
import 'home_page.dart';
import 'login.dart';
import 'main.dart';
import 'message_list.dart';
import 'my_product.dart';
import 'notifications.dart';
import 'setting.dart';


class MainDrawer extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(

        children: <Widget> [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          color: Theme.of(context).primaryColor,
          child: Center(
            child: Row(
              children:<Widget> [
                Container(
                  width: 100,
                  height: 100,
                  margin: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage('https://cdn.pixabay.com/photo/2017/01/31/21/23/avatar-2027366_1280.png'),
                      fit: BoxFit.fill,
                    ),
                  ),

                ),
                Padding(
                  padding: const EdgeInsets.only(left: 40),
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Text('name',style: textStyle),
                        Text('yildız',style: textStyle),
                        Text('urun',style: textStyle),
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
          Expanded(
            child: Container(
              color: Theme.of(context).accentColor,
              child: Column(
                children:<Widget> [
                  ListTile(
                    title: Text('Anasayfa',style: menuTextStyle),
                    onTap:(){
                      Navigator.pushNamed(context, HomePage.routeName);
                    },
                  ),
                  ListTile(
                    title: Text('Bildirimler',style: menuTextStyle),
                    onTap:(){
                      Navigator.pushNamed(context, Notifications.routeName);
                    },
                  ),
                  ListTile(
                    title: Text('Mesajlar',style: menuTextStyle),
                    onTap: (){
                      Navigator.pushNamed(context, MessageList.routeName);
                    },
                  ),
                  ListTile(
                    title: Text('Ürünlerim',style: menuTextStyle),
                    onTap: (){
                      Navigator.pushNamed(context, MyProduct.routeName);
                    },
                  ), ListTile(
                    title: Text('Ayarlar',style: menuTextStyle),
                    onTap:(){
                      Navigator.pushNamed(context, Setting.routeName);
                    },
                  ),ListTile(
                    title: Text('Çıkış',style: menuTextStyle),
                    onTap: (){
                      Navigator.pushNamed(context, Login.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }
}
