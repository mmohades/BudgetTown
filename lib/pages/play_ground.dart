import 'package:budget_down/pages/index.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:budget_down/pages/leaderboard.dart';

class PlayGround extends StatelessWidget {
  const PlayGround({Key key}) : super(key: key);
  final int coinAmount = 300;
  final String playGroundTitle = " Coins: \$";
  final String userName = "John Doe                            ";

  @override
  Widget build(BuildContext context) {

    // return Positioned(
    //   child: 
      return Scaffold(
        appBar: AppBar(
          title: Text(userName + playGroundTitle + coinAmount.toString()),
          actions: <Widget> [
            new IconButton(
              icon: new Icon(Icons.score),
              onPressed: () {
                // Leaderboard();
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
            const SizedBox(height: 30),
            RaisedButton(
              onPressed: (){ 
                // showBottomSheet(
                //   context: context,
                //   builder: (context) {
                //     return BottomSheet(builder: (BuildContext context) {
                //       return Column(
                //         children: <Widget>[
                //           Text('Tree: \$150'),
                //           Text('House: \$400'),
                //           Text('Restaurant: \$600'),
                //           Text('Building: \$1000'),
                //         ],
                //       );
                //     }, onClosing: () {},
                //     );
                //   }
                // );
              },
              child: const Text(
                'Empty Spot Button',
                style: TextStyle(fontSize: 20)
              ),
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
                          child: new Text("Tree: \$150", style: new TextStyle(color: Colors.white, fontSize: 20.0))
                          ),
                      ),
                      new RaisedButton(
                        onPressed: null,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: new Text("House: \$400", style: new TextStyle(color: Colors.white, fontSize: 20.0)),
                        ),
                      ),
                      // new Padding(padding: new EdgeInsets.all(5.00)),
                      new RaisedButton(
                        onPressed: null,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child:  new Text("Restaurant: \$800", style: new TextStyle(color: Colors.white, fontSize: 20.0)),
                        ),
                      ),
                      new RaisedButton(
                        onPressed: null,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: new Text("Building: \$1000", style: new TextStyle(color: Colors.white, fontSize: 20.0)),
                        )
                      )
                    ],
                  ),
                ),
                Container(
                  // margin: const EdgeInsets.only(top: -300),
                  child: Text(
                    'Hello World'
                  )
                ),
              ],
            )
          ],
        ),
      );
    // );
  }
}