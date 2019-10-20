import 'package:budget_town/pages/index.dart';
import 'package:budget_town/shared/model/building.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:budget_town/shared/model/building.dart';

import '../shared/Global.dart';
import '../shared/model/user.dart';

class PlayGround extends StatefulWidget {
  final User user;
  final bool hasAccessToEdit;
  const PlayGround(
      {Key key, @required this.user, @required this.hasAccessToEdit})
      : super(key: key);

  @override
  _PlayGroundState createState() => _PlayGroundState();
}

class _PlayGroundState extends State<PlayGround> {
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
    if (widget.hasAccessToEdit) {
      setState(() {
        widget.user.coins -= coins;
      });
    }
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

  final String coinImageName = 'Design/Coins.png';

  @override
  Widget build(BuildContext context) {
    var _leading = Padding(
      padding: const EdgeInsets.only(left: 15.0),
      child: CircleAvatar(
        child: Image.asset('Design/${widget.user.profileImageName}'),
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(widget.user.coins.toString()),
            SizedBox(
              height: 30,
              child: Image.asset(coinImageName),
            ),
          ],
        ),
        leading: widget.hasAccessToEdit ? _leading : null,
        actions: <Widget>[
          if (widget.hasAccessToEdit)
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              if (!widget.hasAccessToEdit) _leading,
              SizedBox(width: 10),
              Text(
                "${widget.user.name}'s Town",
                style: Theme.of(context).textTheme.headline,
              ),
            ],
          ),
          Expanded(
            child: StaggeredGridView.countBuilder(
              itemCount: colors.length,
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
                  imgFile: (widget.user.buildings.isNotEmpty &&
                          widget.user.buildings[index] != null)
                      ? widget.user.buildings[index].name
                      : null,
                  index: index,
                  updateUserBuildings: _updateUserBuildings,
                  user: widget.user,
                  hasAccessToEdit: widget.hasAccessToEdit,
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

  _updateUserBuildings(int index, Building building) {
    if (widget.hasAccessToEdit) {
      setState(() {
        widget.user.buildings[index] = building;
      });
    }
  }
}

class _Example01Tile extends StatefulWidget {
  _Example01Tile(this.backgroundColor,
      {this.buildingName,
      this.notiftParent,
      this.imgFile,
      this.index,
      this.updateUserBuildings,
      this.user,
      @required this.hasAccessToEdit});
  final User user;
  final String imgFile;
  final Color backgroundColor;
  final String buildingName;
  final int index;
  final Function(int coins) notiftParent;
  final Function(int index, Building building) updateUserBuildings;
  final bool hasAccessToEdit;

  @override
  __Example01TileState createState() => __Example01TileState();
}

class __Example01TileState extends State<_Example01Tile> {
  String imgFile;

  @override
  void initState() {
    super.initState();
    imgFile = widget.imgFile ?? null;
  }

  List<Building> buildings = BuildingdProvider.initBuildings();

  @override
  Widget build(BuildContext context) {
    return new Card(
      color: widget.backgroundColor,
      child: new InkWell(
        onTap: () async {
          if (!widget.hasAccessToEdit) return;
          await _askUserForImage(context);
        },
        child: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: new Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: (imgFile == null && widget.hasAccessToEdit)
                      ? Icon(
                          Icons.add,
                          color: Colors.white,
                        )
                      : _buildImage(),
                ),
              ),
              Text(
                  widget.user.buildings[widget.index] == null
                      ? ""
                      : widget.user.buildings[widget.index].name,
                  textAlign: TextAlign.center),
            ],
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
        if (widget.user.coins < val.constructionCost) {
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                title: Text('Error: Not enough coins ☹️'),
              );
            },
          );
        } else {
          setState(() {
            imgFile = val.name;
            widget.updateUserBuildings(widget.index, val);
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
