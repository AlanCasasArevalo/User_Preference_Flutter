import 'package:flutter/material.dart';
import 'package:user_preference_app/src/widgets/menu_widget.dart';

class SettingsPage extends StatefulWidget {
  static final String routeName = 'settings_page';

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _secondColor;
  int _gender;
  String _userName;

  TextEditingController _textEditingController;

  @override
  void initState() {
    super.initState();
    _secondColor = false;
    _gender = 1;
    _userName = 'Pedro';
    _textEditingController = TextEditingController(text: _userName);
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
              onChanged: (value) {
                _changeRadioButton(value);
              }),
          RadioListTile(
              title: Text('Femenino'),
              value: 2,
              groupValue: _gender,
              onChanged: (value) {
                _changeRadioButton(value);
              }),
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

  void _changeRadioButton(int value) {
    setState(() {
      _gender = value;
    });
  }
}
