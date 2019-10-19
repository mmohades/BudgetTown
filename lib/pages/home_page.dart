import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  final String pageTitle = 'October Budget Status';

  final IconData coinIcon = Icons.attach_money;
  final String howMuchcoin = '300';

  final String breakDownTitle = 'Here is breakdown';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(pageTitle),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: Row(
              children: <Widget>[
                Icon(coinIcon),
                Text(howMuchcoin),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            _budgetPercentIndicator(context),
            SizedBox(height: 40),
            Text(
              breakDownTitle,
              style: Theme.of(context).textTheme.subhead,
            ),
            SizedBox(height: 10),
            SizedBox(
              height: 250, // TODO: make this dynamic
              child: _breakdown(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _breakdown() {
    return ListView(
      children: <Widget>[
        _breakDownListTile(
          'Transportation',
          '\$56.14',
          Icon(Icons.airplanemode_active),
          Colors.red,
        ),
        _breakDownListTile(
          'Restaurant',
          '\$28.16',
          Icon(Icons.local_dining),
          Colors.blue,
        ),
        _breakDownListTile(
          'Other',
          '\$34.16',
          Icon(Icons.more_vert),
          Colors.grey,
        ),
      ],
    );
  }

  Widget _breakDownListTile(
      String title, String spend, Icon icon, Color color) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: icon,
      ),
      title: Text(title),
      subtitle: Text(spend),
      trailing: Icon(Icons.arrow_forward_ios),
    );
  }

  Center _budgetPercentIndicator(BuildContext context) {
    return Center(
      child: CircularPercentIndicator(
        radius: 200,
        percent: 0.9,
        lineWidth: 10,
        startAngle: 180,
        linearGradient: LinearGradient(
          // TODO: make it smoother
          begin: Alignment(0, 1),
          end: Alignment(0.2, 1),
          colors: <Color>[
            Colors.yellow,
            Colors.red,
          ],
        ),
        center: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '\$1,004',
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'of \$1,200',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        footer: Text('13 days left'),
      ),
    );
  }
}
