import 'package:budget_town/shared/data_provider.dart';
import 'package:budget_town/shared/model/index.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  final String title;
  final List<Transactions> transactions;
  final Category category;
  const TransactionPage({
    Key key,
    this.transactions,
    this.title,
    this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Transactions.getColor(category),
            ),
            child: Icon(Transactions.getIcon(category), size: 100),
          ),
          SizedBox(height: 10),
          Text(
            title,
            style: Theme.of(context).textTheme.headline,
          ),
          Divider(),
          Expanded(
            child: ListView.separated(
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                    transactions[index].isConfirmed
                        ? transactions[index].dateName
                        : transactions[index].getStatusName(),
                  ),
                  subtitle: Text(transactions[index].paidTo),
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                          '\$${transactions[index].amount.toStringAsFixed(2)}'),
                      Text(
                          '\$${DataProvider.getCreaditCard().balanceFake.toStringAsFixed(2)}'),
                    ],
                  ),
                );
              },
              itemCount: transactions.length,
              separatorBuilder: (BuildContext context, int index) {
                return Divider();
              },
            ),
          ),
        ],
      ),
    );
  }
}
