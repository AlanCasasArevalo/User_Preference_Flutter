import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {

  static final String routeName = 'settings_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      body: Center(
        child: Text('Pagina de ajustes'),
      ),
    );
  }
}
