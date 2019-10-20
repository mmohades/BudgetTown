import 'package:budget_town/shared/model/index.dart';

class CreditCard {
  String cardNumber;
  DateTime balanceDue;
  double cardLimit;

  List<Transactions> transactions;

  double get balanceFake {
    double b = 0;
    transactions.forEach((item) {
      b += item.amount;
    });
    return b;
  }

  CreditCard({
    this.cardNumber,
    this.balanceDue,
    this.cardLimit,
    this.transactions,
  });

  double get transportationBalance {
    double b = 0;
    transactions.forEach((item) {
      if (item.category == Category.transportation) {
        b += item.amount;
      }
    });
    return b;
  }

  double get foodBalance {
    double b = 0;
    transactions.forEach((item) {
      if (item.category == Category.food) {
        b += item.amount;
      }
    });
    return b;
  }

  double get othersBalance {
    double b = 0;
    transactions.forEach((item) {
      if (item.category == Category.others) {
        b += item.amount;
      }
    });
    return b;
  }
}
