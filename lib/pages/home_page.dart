import 'dart:async';
import 'package:budget_town/pages/index.dart';
import 'package:budget_town/shared/Global.dart';
import 'package:budget_town/shared/data_provider.dart';
import 'package:budget_town/shared/model/index.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import 'package:date_util/date_util.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  User user = Global.user;
  CreditCard get creditCard => user.creditCard;

  final String pageTitle =
      '${DateUtil().month(DateTime.now().month)} Budget Status';

  final String coinImageName = 'Design/Coins.png';

  final String breakDownTitle = 'Expenses Breakdown';

  _checkEveryDay() {
    Timer.periodic(Duration(hours: 1), (timer) {
      if (user.isUndeBudgetForToday) {
        setState(() {
          user.coins++;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    _checkEveryDay();
  }

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
                SizedBox(
                  height: 30,
                  child: Image.asset(coinImageName),
                ),
                Text(user.coins.toString()),
              ],
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: <Widget>[
            Material(
              child: InkWell(
                child: _budgetPercentIndicator(context),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PurchaseChart()),
                  );
                },
              )
            ),
            SizedBox(height: 50),
            Text(
              breakDownTitle,
              style: Theme.of(context).textTheme.subhead,
            ),
            SizedBox(height: 10),
            Expanded(
              child: _breakdown(context),
            ),
          ],
        ),
      ),
    );
  }

  Widget _breakdown(BuildContext context) {
    return ListView(
      children: <Widget>[
        _breakDownListTile(
          'Transportation',
          '\$${creditCard.transportationBalance.toStringAsFixed(2)}',
          Icon(Transactions.getIcon(Category.transportation)),
          Colors.red,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TransactionPage(
                  title: 'Transportation',
                  transactions: DataProvider.transportationTransactions(
                    creditCard.transactions,
                  ),
                  category: Category.transportation,
                ),
              ),
            );
          },
        ),
        _breakDownListTile(
          'Food',
          '\$${creditCard.foodBalance.toStringAsFixed(2)}',
          Icon(Transactions.getIcon(Category.food)),
          Colors.blue,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TransactionPage(
                  title: 'Food',
                  transactions: DataProvider.foodTransactions(
                    creditCard.transactions,
                  ),
                  category: Category.food,
                ),
              ),
            );
          },
        ),
        _breakDownListTile(
          'Other',
          '\$${creditCard.othersBalance.toStringAsFixed(2)}',
          Icon(Transactions.getIcon(Category.others)),
          Colors.grey,
          () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TransactionPage(
                  title: 'Other',
                  transactions: DataProvider.othersTransactions(
                    creditCard.transactions,
                  ),
                  category: Category.others,
                ),
              ),
            );
          },
        ),
      ],
    );
  }

  Widget _breakDownListTile(
    String title,
    String spend,
    Icon icon,
    Color color,
    VoidCallback onTap,
  ) {
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
      onTap: onTap ?? null,
    );
  }

  Center _budgetPercentIndicator(BuildContext context) {
    double radius = 200;

    double lineWidth = 10;
    double startAngle = 180;

    double currentAmout = creditCard.balanceFake;

    double percent = currentAmout / user.budget;

    return Center(
      child: CircularPercentIndicator(
        radius: radius,
        percent: percent,
        lineWidth: lineWidth,
        startAngle: startAngle,
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
              '\$${creditCard.balanceFake.toStringAsFixed(2)}',
              style: Theme.of(context).textTheme.headline,
            ),
            Text(
              'of \$${user.budget.floor()}',
              style: Theme.of(context).textTheme.caption,
            ),
          ],
        ),
        footer: Text('${user.daysLeft} days left'),
      ),
    );
  }
}
