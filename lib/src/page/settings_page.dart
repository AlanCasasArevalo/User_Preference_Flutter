import 'package:flutter/material.dart';
import 'package:user_preference_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatelessWidget {

  static final String routeName = 'settings_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: MenuWidget(),
      body: Center(
        child: Text('Pagina de ajustes'),
      ),
    );
  }
}
