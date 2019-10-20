import 'package:budget_town/pages/index.dart';
import 'package:budget_town/shared/model/building.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:budget_town/shared/model/building.dart';

import '../shared/Global.dart';
import '../shared/model/user.dart';

class CityViewer extends StatefulWidget {
  const CityViewer({Key key}) : super(key: key);

  @override
  _CityViewerState createState() => _CityViewerState();
}

class _CityViewerState extends State<CityViewer> {
  final String userName = "John's Town";
  User user = Global.user;

  List<StaggeredTile> _staggeredTiles = const <StaggeredTile>[
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(2, 1),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(2, 2),
    const StaggeredTile.count(1, 2),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(3, 1),
    const StaggeredTile.count(1, 1),
    const StaggeredTile.count(4, 1),
  ];

  List<Widget> _tiles = const <Widget>[
    const _Example01Tile(Colors.green, Icons.widgets),
    const _Example01Tile(Colors.lightBlue, Icons.wifi),
    const _Example01Tile(Colors.amber, Icons.panorama_wide_angle),
    const _Example01Tile(Colors.brown, Icons.map),
    const _Example01Tile(Colors.deepOrange, Icons.send),
    const _Example01Tile(Colors.indigo, Icons.airline_seat_flat),
    const _Example01Tile(Colors.red, Icons.bluetooth),
    const _Example01Tile(Colors.pink, Icons.battery_alert),
    const _Example01Tile(Colors.purple, Icons.desktop_windows),
    const _Example01Tile(Colors.blue, Icons.radio),
  ];

  final String coinImageName = 'Design/Coins.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(user.coins.toString()),
            SizedBox(
              height: 30,
              child: Image.asset(coinImageName),
            ),
          ],
        ),
        leading: Padding(
          padding: const EdgeInsets.only(left: 15.0),
          child: CircleAvatar(
            radius: 5,
            child: Image.asset('Design/User_Image.png'),
          ),
        ),
        actions: <Widget>[
          new IconButton(
            icon: new Image.asset("Design/leaderboard.png"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Leaderboard()),
              );
            },
          ),
        ],
      ),
      body: Column(
        children: <Widget>[
          Text(
            "Friend's Town",
            style: Theme.of(context).textTheme.headline,
          ),
          Expanded(
            child: StaggeredGridView.count(
              crossAxisCount: 4,
              staggeredTiles: _staggeredTiles,
              children: _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
              // physics: NeverScrollableScrollPhysics(),
            ),
          ),
        ],
      ),
    );
    // );
  }
}

class _Example01Tile extends StatefulWidget {
  const _Example01Tile(this.backgroundColor, this.iconData,
      {this.buildingName});
  final Color backgroundColor;
  final IconData iconData;
  final String buildingName;

  @override
  __Example01TileState createState() => __Example01TileState();
}

class __Example01TileState extends State<_Example01Tile> {
  User user = Global.user;
  String imgFile;
  Building selectedBuilding;
  List<String> imgNames = [
    'Airport',
    'Bank',
    'Bowling',
    'Coffee shop',
    'Condo',
    'Fire station',
    'Fountain',
    'Hospital',
    'House',
    'Museum',
    'Park',
    'Pizzeria',
    'Police station',
    'Pub',
    'School',
    'Skyscraper',
    'Supermarket',
    'Townhouse',
  ];

  List<Building> buildings = BuildingdProvider.initBuildings();

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: widget.backgroundColor,
      child: new InkWell(
        onTap: () {},
        child: new Column(
          children: <Widget>[
            Expanded(
              child: new Padding(
                padding: const EdgeInsets.all(4.0),
                child: (imgFile == null)
                    ? Icon(
                        Icons.add,
                        color: Colors.white,
                      )
                    : _buildImage(),
              ),
            ),
            Expanded(
              child: Text(selectedBuilding == null ? "" : selectedBuilding.name,
                  textAlign: TextAlign.center),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Image.asset('Design/buildings/$imgFile.png');
  }
}