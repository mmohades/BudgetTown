import 'package:budget_town/pages/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlayGround extends StatelessWidget {
  const PlayGround({Key key}) : super(key: key);
  final int coinAmount = 300;
  final String playGroundTitle = " Coins: \$";
  final String userName = "John's Town";

  @override
  Widget build(BuildContext context) {
    // return Positioned(
    //   child:
    return Scaffold(
      appBar: AppBar(
        // title: Text(userName + playGroundTitle + coinAmount.toString()),
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
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            bottom: 0,
            child: Image.asset(
              'Design/MainCity.png',
              fit: BoxFit.contain,
            ),
          ),
          Positioned(
            top: 60,
            left: 0,
            right: 0,
            child: _buildButtons(),
          ),
        ],
      ),
    );
    // );
  }

  Column _buildButtons() {
    return Column(
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              child: Container(height: 100, width: 100, child: null
                  // fit: BoxFit.cover,
                  ),
              onPressed: () {},
            ),
            FlatButton(
              child: Center(
                child: Icon(Icons.add),
              ),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FlatButton(
              child: Center(
                child: Icon(Icons.add),
              ),
              onPressed: () {},
            ),
            FlatButton(
              child: Center(
                child: Icon(Icons.add),
              ),
              onPressed: () {},
            ),
          ],
        ),
      ],
    );
  }

  Column _buildColumn() {
    return Column(
      children: <Widget>[
        const SizedBox(height: 30),
        RaisedButton(
          onPressed: () {},
          child:
              const Text('Empty Spot Button', style: TextStyle(fontSize: 20)),
        ),
        new Row(
          children: [
            Container(
              height: 400.0,
              width: 200.0,
              margin: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: new ListView(
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  new RaisedButton(
                    onPressed: null,
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: new Text("Tree: \$150",
                            style: new TextStyle(
                                color: Colors.white, fontSize: 20.0))),
                  ),
                  new RaisedButton(
                    onPressed: null,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Text("House: \$400",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 20.0)),
                    ),
                  ),
                  // new Padding(padding: new EdgeInsets.all(5.00)),
                  new RaisedButton(
                    onPressed: null,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: new Text("Restaurant: \$800",
                          style: new TextStyle(
                              color: Colors.white, fontSize: 20.0)),
                    ),
                  ),
                  new RaisedButton(
                      onPressed: null,
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: new Text("Building: \$1000",
                            style: new TextStyle(
                                color: Colors.white, fontSize: 20.0)),
                      ))
                ],
              ),
            ),
            Container(
                // margin: const EdgeInsets.only(top: -300),
                child: Text('Hello World')),
          ],
        )
      ],
    );
  }
}
