import 'package:flutter/material.dart';
import 'package:user_preference_app/src/page/settings_page.dart';

class HomePage extends StatelessWidget {
  static final String routeName = 'home_page';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Preferencias de usuario'),
      ),
      drawer: _builderMenu(context),
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

  Drawer _builderMenu(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            child: Container(),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/menu_img.jpg'),
                    fit: BoxFit.cover)
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.blue,
            ),
            title: Text('Home'),
            onTap: () {
              Navigator.pushReplacementNamed(context, HomePage.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.people,
              color: Colors.blue,
            ),
            title: Text('Party mode'),
            onTap: () {},
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: Colors.blue,
            ),
            title: Text('Ajustes'),
            onTap: () {
              // Navigator.pop(context);
              // Navigator.pushNamed(context, SettingsPage.routeName);
              Navigator.pushReplacementNamed(context, SettingsPage.routeName);
            },
          ),
        ],
      ),
    );
  }
}
