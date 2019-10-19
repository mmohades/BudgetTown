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
                'Empty Spot',
                style: TextStyle(fontSize: 20)
              ),
            ),
            Text(
              'Hello World'
            ),
            new Row(
              children: [
                Container(
                  height: 300.0,
                  width: 200.0,
                  margin: const EdgeInsets.only(left: 20.0, right: 20.0),
                  child: new ListView(
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      new RaisedButton(
                        onPressed: null,
                        child: new Text("Microsoft")
                      ),
                      new RaisedButton(
                        onPressed: null,
                        child: new Text("Facebook"),
                      ),
                      // new Padding(padding: new EdgeInsets.all(5.00)),
                      new RaisedButton(
                        onPressed: null,
                        child: new Text("Google"),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: -300),
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