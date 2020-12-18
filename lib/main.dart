import 'package:flutter/material.dart';
import 'package:user_preference_app/src/page/home_page.dart';
import 'package:user_preference_app/src/page/settings_page.dart';
import 'package:user_preference_app/src/shared_preference/user_shared_preferences.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  final preference = UserSharedPreferences();
  await preference.initPreferences();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final preference = UserSharedPreferences();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Preference',
      initialRoute: preference.lastPage,
      routes: {
        HomePage.routeName : (BuildContext context) => HomePage(),
        SettingsPage.routeName : (BuildContext context) => SettingsPage(),
      },
    );
  }
}
