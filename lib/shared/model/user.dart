import 'dart:async';

import 'package:budget_down/shared/data_provider.dart';
import 'package:budget_down/shared/model/index.dart';
import 'package:date_util/date_util.dart';

class User {
  String name;
  String id;

  CreditCard creditCard = DataProvider.getCreaditCard();
  // SavingAccount savingAccount = DataProvider.getSavingAcc();

  int coins;

  double budget; // monthly budeget
  double get dailyBudget =>
      double.parse((budget / daysInMonth).toStringAsFixed(2));
  double get amountCanBeSpentTillThisDay => dailyBudget * DateTime.now().day;
  bool get isUndeBudgetForToday =>
      amountCanBeSpentTillThisDay >= creditCard.balanceFake;

  int get daysInMonth =>
      DateUtil().daysInMonth(DateTime.now().month, DateTime.now().year);
  int get daysLeft => daysInMonth - DateTime.now().day;

  User({this.name, this.id, this.coins = 300, this.budget = 0});
}
