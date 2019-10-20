import 'package:flutter/material.dart';
import 'package:budget_town/pages/index.dart';
import 'package:budget_town/shared/Global.dart';
import 'package:budget_town/shared/model/index.dart';

class Settings extends StatefulWidget {
  const Settings({Key key}) : super(key: key);

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  User user = Global.user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Settings')),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 50.0),
              Expanded(
                child: _options(context),
              ),
            ],
          ),
        ));
  }

  Widget _options(BuildContext context) {
    return ListView(
      children: <Widget>[
        _optionsListTitle('Account Profile', Icon(Icons.person), Colors.grey,
            () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SetupAccount(title: 'Account Profile')));
        }),
        SizedBox(height: 10.0),
        _optionsListTitle(
            'Setup Bank Connection', Icon(Icons.attach_money), Colors.green,
            () {
          Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => SetupBank(title: 'Bank Account')));
        }),
        SizedBox(height: 10.0),
        _optionsListTitle(
          'Setup Budget Goal',
          Icon(Icons.person_pin),
          Colors.black,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SetupBudget(
                  title: 'Set your Budget'
                )
              )
            );
          }
        ),
      ],
    );
  }

  Widget _optionsListTitle(
    String title,
    Icon icon,
    Color color,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(10)),
        child: icon,
      ),
      title: Text(title),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap ?? null,
    );
  }
}
