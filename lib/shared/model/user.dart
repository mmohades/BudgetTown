import 'dart:async';

import 'package:budget_town/shared/data_provider.dart';
import 'package:budget_town/shared/model/index.dart';
import 'package:date_util/date_util.dart';

import 'building.dart';

class User {
  String name;
  String id;

  String customerId;

  CreditCard creditCard = DataProvider.getCreaditCard();
  // SavingAccount savingAccount = DataProvider.getSavingAcc();

  int coins;
  String profileImageName;

  double budget; // monthly budeget
  double get dailyBudget =>
      double.parse((budget / daysInMonth).toStringAsFixed(2));
  double get amountCanBeSpentTillThisDay => dailyBudget * DateTime.now().day;
  bool get isUndeBudgetForToday =>
      amountCanBeSpentTillThisDay >= creditCard.balanceFake;

  int get daysInMonth =>
      DateUtil().daysInMonth(DateTime.now().month, DateTime.now().year);
  int get daysLeft => daysInMonth - DateTime.now().day;

  //
  Map<int, Building> buildings = {};

  User({
    this.name,
    this.id,
    this.coins = 1125,
    this.budget = 0,
    this.profileImageName = "user_image",
    this.buildings,
  });
}

class Users {
  static final ANNA = User(
      name: "Anna",
      id: "001",
      coins: 4500,
      budget: 1200,
      profileImageName: "anna.png",
      buildings: {
        0: Buildings.AIRPORT,
        4: Buildings.BOWLING,
        5: Buildings.FIRE_STATION
      });
  static final BOB = User(
      name: "Bob",
      id: "002",
      coins: 450,
      budget: 600,
      profileImageName: 'bob.png');
  static final JONY = User(
      name: "Jony",
      id: "003",
      coins: 850,
      budget: 1100,
      profileImageName: "jony.png",
      buildings: {
        2: Buildings.AIRPORT,
        3: Buildings.BOWLING,
        4: Buildings.FIRE_STATION
      });
  static final MARK = User(
      name: "Mark",
      id: "004",
      coins: 9200,
      budget: 800,
      profileImageName: "john.png");
  static final MEHMET = User(
      name: "Mehmet",
      id: "005",
      coins: 4500,
      budget: 90,
      profileImageName: "mehmet.png");
}
