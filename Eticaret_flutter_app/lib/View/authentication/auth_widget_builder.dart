import 'package:e_ticaret_flutter_app/View/authentication/service/auth_service.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AuthWidgetBuilder extends StatelessWidget {
  const AuthWidgetBuilder({Key key, @required this.builder}) : super(key: key);
  final Widget Function(BuildContext, AsyncSnapshot<User>) builder;

  @override
  Widget build(BuildContext context) {
    print('AuthWidgetBuilder rebuild');
    final authService =
    Provider.of<AuthService>(context, listen: false);
    return StreamBuilder<User>(
      stream: authService.authStateChanges,
      builder: (context, snapshot) {
        print('StreamBuilder: ${snapshot.connectionState} , ${snapshot.data}');
        final User user = snapshot.data;
        if (user != null) {
          return MultiProvider(
            providers: [
              Provider<User>.value(value: user),
            ],
            child: builder(context, snapshot),
          );
        }
        return builder(context, snapshot);
      },
    );
  }
}