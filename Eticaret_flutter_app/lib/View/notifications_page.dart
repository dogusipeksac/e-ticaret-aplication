import 'package:e_ticaret_flutter_app/Core/Service/notification_service.dart';
import 'package:e_ticaret_flutter_app/DesignStyle/colors_cons.dart';
import 'package:e_ticaret_flutter_app/Model/notification.dart';
import 'package:flutter/material.dart';
import '../Map/main_drawer.dart';

//bildirimler sayfasi
class Notifications extends StatelessWidget {
  NotificationService _notificationService = NotificationService();
  List names = [
    "Doğuş İpeksaç",
    "Bünyamin Ertaş",
    "Tuba Günaçgün",
    "Bekir Demir",
    "Volkan Üstekidag",
    "Ali",
    "Zeynep",
    "Nagihan",
    "Güler",
    "Alamettin"
  ];

  static String routeName = '/routeNotificationPage';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: background,
      appBar: AppBar(
        title: Text('Bildirimler'),
        backgroundColor: background,
      ),
      drawer: MainDrawer(),
      body: StreamBuilder(
        stream: _notificationService.getUserNotificationList(),
        builder: (builderContext,snapshot){
          if(snapshot.hasData){
            List<NotificationModel> list = snapshot.data;
            return ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              itemBuilder: (BuildContext context, int index) => Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
                child: Card(
                  color: background,
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(0.0),
                  ),
                  child: Container(
                    decoration:  BoxDecoration(
                        color: filterBackground,
                        borderRadius:
                        BorderRadius.all(Radius.circular(10.0))),

                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            height: 55,
                            color: filterBackground,
                            child: CircleAvatar(
                              backgroundColor: filterBackground,
                              foregroundColor: filterBackground,
                              backgroundImage: NetworkImage(list[index].willingImage),
                            ),
                          ),
                        ),

                        Expanded(
                          flex: 4,
                          child: Container(
                            margin: EdgeInsets.all(5),
                            alignment: Alignment.centerLeft,
                            child: Text(
                              list[index].willingName + " ilanını istek listesine ekledi",
                              style: TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return CircularProgressIndicator();

        },
      ),
    );
  }

  ///geting data from firebase
  /*StreamBuilder getDatas({Widget child}){
    return StreamBuilder(
      stream: _notificationService.getUserNotificationList(),
      builder: (builderContext,notifyList){
        if(notifyList.hasData){
          List<NotificationModel> list = notifyList.data;
          print("${list.length}");
          return child;
        }
        return CircularProgressIndicator();
      },
    );
  }*/
}
