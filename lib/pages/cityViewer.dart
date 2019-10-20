import 'package:budget_town/shared/data_provider.dart';
import 'package:budget_town/shared/model/index.dart';
import 'package:flutter/material.dart';

class CityViewer extends StatelessWidget {
  final String title;
  const CityViewer({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            child: Icon(Icons.star),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.headline,
          ),
          Divider(),
        ],
      ),
    );
  }
}
