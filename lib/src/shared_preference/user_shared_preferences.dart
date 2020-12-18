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

  get getGender {
    return _preferences.getInt('gender') ?? 1;
  }

  set setGender (int value) {
    _preferences.setInt('gender', value ?? 1);
  }

}