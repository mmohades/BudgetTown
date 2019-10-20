import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Leaderboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Leaderboard'),
        ),
        body: Column(children: <Widget>[
          Expanded(
            child: _breakdown(context),
          )
        ]));
  }

  Widget _breakdown(BuildContext context) {
    return ListView(
      children: <Widget>[
        _breakDownListTile(
          'Anna Town',
          '300 Coins',
          Icon(Icons.star),
          Colors.red,
          () {},
        ),
      ],
    );
  }

  Widget _breakDownListTile(
    String title,
    String spend,
    Icon icon,
    Color color,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: icon,
      ),
      title: Text(title),
      subtitle: Text(spend),
      trailing: Icon(Icons.arrow_forward_ios),
      onTap: onTap ?? null,
    );
  }
}
