import 'package:budget_town/pages/cityViewer.dart';
import 'package:budget_town/shared/model/index.dart';
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
    var anna = Users.ANNA;
    var jony = Users.JONY;
    return ListView(
      children: <Widget>[
        createLeaderboardCell(anna, context),
        createLeaderboardCell(jony, context)
      ],
    );
  }

  createLeaderboardCell(user, context) {
    return _breakDownListTile('${user.name}\'s Town', '${user.coins} Coins',
        Image.asset('Design/${user.profileImageName}'), Colors.red, () {});
  }

  Widget _breakDownListTile(
    String title,
    String spend,
    Image icon,
    Color color,
    VoidCallback onTap,
  ) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(50),
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
