import 'package:budget_down/shared/model/index.dart';
import 'package:budget_down/shared/model/saving_account.dart';

class DataProvider {
  static SavingAccount getSavingAcc() {
    return SavingAccount(
      acountNumber: 'jd18anl17na',
      balance: 2000,
      transactions: _getSavingTransactions(),
    );
  }

  static CreditCard getCreaditCard() {
    return CreditCard(
      cardNumber: 'ma2na84na',
      balanceDue: DateTime(2019, 11, 1, 1),
      cardLimit: 3000,
      transactions: _getCreditCardTransactions(),
    );
  }

  static List<Transactions> _getCreditCardTransactions() {
    return [
      Transactions(
        date: DateTime.now(),
        status: Status.pending,
        amount: 20.12,
        paidTo: 'Dominos',
        category: Category.food,
      ),
      Transactions(
        date: DateTime.now(),
        status: Status.pending,
        amount: 121,
        paidTo: 'MTA',
        category: Category.transportation,
      ),
      Transactions(
        date: DateTime(2019, 7, 2, 1),
        status: Status.confirmed,
        amount: 121,
        paidTo: 'MTA',
        category: Category.transportation,
      ),
      Transactions(
        date: DateTime(2019, 9, 2, 1),
        status: Status.confirmed,
        amount: 121,
        paidTo: 'MTA',
        category: Category.transportation,
      ),
      Transactions(
        date: DateTime(2019, 5, 2, 1),
        status: Status.confirmed,
        amount: 10.01,
        paidTo: 'Others',
        category: Category.others,
      ),
      Transactions(
        date: DateTime(2019, 2, 2, 1),
        status: Status.confirmed,
        amount: 14.32,
        paidTo: 'Others',
        category: Category.others,
      ),
      Transactions(
        date: DateTime(2019, 2, 2, 1),
        status: Status.confirmed,
        amount: 9.9,
        paidTo: 'MBJ',
        category: Category.food,
      ),
    ];
  }

  static List<Transactions> _getSavingTransactions() {
    return [
      Transactions(
        date: DateTime.now(),
        status: Status.pending,
        amount: 20,
        paidTo: 'Dominos',
        category: Category.food,
      ),
      Transactions(
        date: DateTime.now(),
        status: Status.pending,
        amount: 121,
        paidTo: 'MTA',
        category: Category.transportation,
      ),
      Transactions(
        date: DateTime(2019, 3, 1, 1),
        status: Status.confirmed,
        amount: 121,
        paidTo: 'MTA',
        category: Category.transportation,
      ),
      Transactions(
        date: DateTime(2019, 5, 1, 1),
        status: Status.confirmed,
        amount: 121,
        paidTo: 'MTA',
        category: Category.transportation,
      ),
      Transactions(
        date: DateTime(2019, 5, 2, 1),
        status: Status.confirmed,
        amount: 10.01,
        paidTo: 'Others',
        category: Category.others,
      ),
      Transactions(
        date: DateTime(2019, 2, 2, 1),
        status: Status.confirmed,
        amount: 14.32,
        paidTo: 'Others',
        category: Category.others,
      ),
      Transactions(
        date: DateTime(2019, 2, 2, 1),
        status: Status.confirmed,
        amount: 9.9,
        paidTo: 'MBJ',
        category: Category.food,
      ),
    ];
  }

  static List<Transactions> transportationTransactions(List<Transactions> t) {
    return t.where((item) {
      return item.category == Category.transportation;
    }).toList();
  }

  static List<Transactions> foodTransactions(List<Transactions> t) {
    return t.where((item) {
      return item.category == Category.food;
    }).toList();
  }

  static List<Transactions> othersTransactions(List<Transactions> t) {
    return t.where((item) {
      return item.category == Category.others;
    }).toList();
  }
}
