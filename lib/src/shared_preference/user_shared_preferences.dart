import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {
  static final UserSharedPreferences _instance = UserSharedPreferences._internal();

  factory UserSharedPreferences () {
    return _instance;
  }

  UserSharedPreferences._internal();

  SharedPreferences _preferences;

  initPreferences () async {
    this._preferences = await SharedPreferences.getInstance();
  }

  get gender {
    return _preferences.getInt('gender') ?? 1;
  }

  set gender (int value) {
    _preferences.setInt('gender', value ?? 1);
  }

  get secondColor {
    return _preferences.getBool('secondColor') ?? false;
  }

  set secondColor (bool value) {
    _preferences.setBool('secondColor', value ?? false);
  }

  get userName {
    return _preferences.getString('userName') ?? 'Pedro';
  }

  set userName (String value) {
    _preferences.setString('userName', value ?? '');
  }

  get lastPage {
    return _preferences.getString('lastPage') ?? 'home_page';
  }

  set lastPage (String value) {
    _preferences.setString('lastPage', value ?? 'home_page');
  }

}