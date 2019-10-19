import 'package:budget_down/shared/model/index.dart';

class SavingAccount {
  String acountNumber;
  double balance;
  List<Transactions> transactions;

  double get fakeBalance {
    double b = 0;
    transactions.forEach((item) {
      b += item.amount;
    });
    return b;
  }

  SavingAccount({
    this.acountNumber,
    this.balance,
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
