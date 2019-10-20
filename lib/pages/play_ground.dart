import 'package:budget_town/pages/index.dart';
import 'package:budget_town/shared/model/building.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:budget_town/shared/model/building.dart';

import '../shared/Global.dart';
import '../shared/model/user.dart';

class PlayGround extends StatefulWidget {
  const PlayGround({Key key}) : super(key: key);

  @override
  _PlayGroundState createState() => _PlayGroundState();
}

class _PlayGroundState extends State<PlayGround> {
  final String userName = "John's Town";

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

  _notiftParent(int coins) {
    setState(() {
      Global.user.coins -= coins;
    });
  }

  List<Color> colors = [
    Colors.green,
    Colors.lightBlue,
    Colors.amber,
    Colors.brown,
    Colors.deepOrange,
    Colors.indigo,
    Colors.red,
    Colors.pink,
    Colors.purple,
    Colors.blue,
  ];

  List<Widget> _tiles = <Widget>[
    _Example01Tile(Colors.green),
    _Example01Tile(Colors.lightBlue),
    _Example01Tile(Colors.amber),
    _Example01Tile(Colors.brown),
    _Example01Tile(Colors.deepOrange),
    _Example01Tile(Colors.indigo),
    _Example01Tile(Colors.red),
    _Example01Tile(Colors.pink),
    _Example01Tile(Colors.purple),
    _Example01Tile(Colors.blue),
  ];

  final String coinImageName = 'Design/Coins.png';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(Global.user.coins.toString()),
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
            icon: Icon(Icons.arrow_upward),
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
            "Julia's Town",
            style: Theme.of(context).textTheme.headline,
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              itemCount: _tiles.length,
              crossAxisCount: 4,
              // staggeredTiles: _staggeredTiles,
              // children: _tiles,
              mainAxisSpacing: 4.0,
              crossAxisSpacing: 4.0,
              padding: const EdgeInsets.all(4.0),
              itemBuilder: (BuildContext context, int index) {
                return _Example01Tile(
                  colors[index],
                  notiftParent: _notiftParent,
                );
              },
              staggeredTileBuilder: (int index) {
                return _staggeredTiles[index];
              },
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
  _Example01Tile(this.backgroundColor, {this.buildingName, this.notiftParent});
  final Color backgroundColor;
  final String buildingName;
  final Function(int coins) notiftParent;

  @override
  __Example01TileState createState() => __Example01TileState();
}

class __Example01TileState extends State<_Example01Tile> {
  String imgFile;
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
        onTap: () async {
          await _askUserForImage(context);
        },
        child: new Center(
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
      ),
    );
  }

  Future _askUserForImage(BuildContext context) async {
    // String selectedImg;
    await showModalBottomSheet(
      builder: (BuildContext context) {
        return BottomSheet(
          builder: (BuildContext context) {
            return Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    FlatButton(
                      child: Text('Cancel'),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    'Buildings',
                    style: Theme.of(context).textTheme.title,
                  ),
                ),
                Expanded(
                  child: ListView(
                    children: buildings.map((building) {
                      return ListTile(
                        leading: Image.asset(
                            'Design/buildings/${building.name}.png'),
                        title: Text(building.name),
                        trailing: RaisedButton(
                          child: Text('${building.constructionCost} Coins'),
                          onPressed: () {
                            Navigator.of(context).pop(building);
                          },
                        ),
                        onTap: () {
                          Navigator.of(context).pop(building);
                        },
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          },
          onClosing: () {},
        );
      },
      context: context,
    ).then((val) {
      if (val != null) {
        if (Global.user.coins < val.constructionCost) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error: Not enough coins'),
              );
            },
          );
        } else {
          setState(() {
            // Global.user.coins -= val.constructionCost;
            imgFile = val.name;
            widget.notiftParent(val.constructionCost);
          });
        }
      }
    });
  }

  Widget _buildImage() {
    return Image.asset('Design/buildings/$imgFile.png');
  }
}
