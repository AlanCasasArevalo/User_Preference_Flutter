import 'package:flutter/material.dart';
import 'package:user_preference_app/src/shared_preference/user_shared_preferences.dart';
import 'package:user_preference_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings_page';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondColor = false;
  int _gender;
  String _userName = 'Pedro';

  final preference = UserSharedPreferences();

  TextEditingController _textEditingController;

//WidgetsFlutterBinding.ensureInitialized();
  @override
  void initState() {
    super.initState();
    _gender = preference.gender;
    _secondColor = preference.secondColor;
    _userName = preference.userName;
    _textEditingController = TextEditingController(text: preference.userName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ajustes'),
        backgroundColor:
            preference.secondColor ? Colors.redAccent : Colors.grey,
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
                preference.userName = inputText;
                _userName = inputText;
                setState(() {});
              },
            ),
          ),
        ],
      ),
    );
  }

  void _changeSwitch(bool isChange) {
    setState(() {
      preference.secondColor = isChange;
      _secondColor = isChange;
    });
  }

  _setSelectedRadio(int value) {
    preference.gender = value;
    _gender = value;
    setState(() {});
  }
}
