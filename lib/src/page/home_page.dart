import 'package:flutter/material.dart';
import 'package:user_preference_app/src/widgets/menu_widget.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
      ),
      drawer: MenuWidget(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Color secundario: '),
          Divider(),
          Text('Genero: '),
          Divider(),
          Text('Nombre del usuario: '),
          Divider(),
        ],
      ),
    );
  }
}
