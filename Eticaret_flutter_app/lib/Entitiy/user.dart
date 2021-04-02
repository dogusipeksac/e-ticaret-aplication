


import 'package:flutter/widgets.dart';

class User {

  String _name;
  String _email;
  String _password;
  String _userLocation;
  Image _userImage;

  User(this._name, this._email, this._password, this._userLocation,
      this._userImage);



  Image get userImage => _userImage;

  set userImage(Image value) {
    _userImage = value;
  }

  String get userLocation => _userLocation;

  set userLocation(String value) {
    _userLocation = value;
  }

  String get password => _password;

  set password(String value) {
    _password = value;
  }

  String get email => _email;

  set email(String value) {
    _email = value;
  }

  String get name => _name;

  set name(String value) {
    _name = value;
  }
}