import 'package:flutter/material.dart';

class Settings extends StatelessWidget {
  const Settings({Key key}) : super(key: key);

  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings')
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 50),
            // Expanded(
            //   child: _options(context),
            // ),
          ],
        ),
      ),
    );
  }

  // Widget _options(BuildContext context){
  //   return ListView(
  //     children: <Widget>[
  //       _optionsListTitle(
  //         'Account Profile', Icon(Icons.supervised_user_circle), color, onTap))
  //     ],
  //   );
  // }

  // Widget _optionsListTitle(
  //   String title,
  //   Icon icon, 
  //   Color color,
  //   VoidCallback onTap,
  // ) {
  //   return ListTile(
  //     leading: Container(
  //       padding: const EdgeInsets.all(12.0),
  //       decoration: BoxDecoration(
  //         color: color, 
  //         borderRadius: BorderRadius.circular(10)
  //       ),
  //       child: icon,
  //     ),
  //     title: Text(title),
  //     trailing: Icon(Icons.arrow_forward_ios),
  //     onTap: onTap ?? null,
  //   );
  // }
}