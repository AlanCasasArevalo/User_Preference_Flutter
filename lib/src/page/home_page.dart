import 'package:flutter/material.dart';
import 'package:user_preference_app/src/shared_preference/user_shared_preferences.dart';
import 'package:user_preference_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home_page';
  final preference = UserSharedPreferences();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
        backgroundColor: preference.secondColor ? Colors.redAccent : Colors.grey,
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario: ${preference.secondColor}'),
          Divider(),
          Text('Genero: ${preference.gender}'),
          Divider(),
          Text('Nombre del usuario: ${preference.userName}'),
          Divider(),
        ],
      ),
    );
  }
}
