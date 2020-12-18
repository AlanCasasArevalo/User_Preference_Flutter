import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:user_preference_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings_page';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondColor = false;
  int _gender = 1;
  String _userName = 'Pedro';

  TextEditingController _textEditingController;
//WidgetsFlutterBinding.ensureInitialized();
  @override
  void initState() {
    super.initState();
    _loadPreference();
    _textEditingController = TextEditingController(text: _userName);
  }

  _loadPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _gender = prefs.getInt('gender');
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
      ),
      drawer: MenuWidget(),
      body: ListView(
        children: [
          Container(
            padding: EdgeInsets.all(8),
            child: Text(
              'Settings',
              style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          SwitchListTile(
              title: Text('Color secundario'),
              value: _secondColor,
              onChanged: (isChange) {
                _changeSwitch(isChange);
              }),
          RadioListTile(
              title: Text('Masculino'),
              value: 1,
              groupValue: _gender,
              onChanged: _setSelectedRadio),
          RadioListTile(
              title: Text('Femenino'),
              value: 2,
              groupValue: _gender,
              onChanged: _setSelectedRadio),
          Divider(),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                  labelText: _userName,
                  helperText: 'Nombre de la persona usando el dispositivo'),
              onChanged: (inputText) {
                setState(() {
                  _userName = inputText;
                });
              },
            ),
          )
        ],
      ),
    );
  }

  void _changeSwitch(bool isChange) {
    setState(() {
      _secondColor = isChange;
    });
  }

  _setSelectedRadio(int value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt('gender', value);
    _gender = value;
    setState(() {});
  }
}
