import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlayGround extends StatelessWidget {
  const PlayGround({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // return Positioned(
    //   child: 
      return Column(
        children: <Widget>[
          const SizedBox(height: 30),
          RaisedButton(
            onPressed: (){ 
              showBottomSheet(
                context: context,
                builder: (context) {
                  return BottomSheet(builder: (BuildContext context) {
                    return Column(
                      children: <Widget>[
                        Text('Tree: \$150'),
                        Text('House: \$400'),
                        Text('Restaurant: \$600'),
                        Text('Building: \$1000'),
                      ],
                    );
                  }, onClosing: () {},
                  );
                }
              );
            },
            child: const Text(
              'Empty Spot',
              style: TextStyle(fontSize: 20)
            ),
          ),
        ],
      );
    // );
  }
}