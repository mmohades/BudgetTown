import 'package:flutter/material.dart';

enum Category { transportation, food, others }

enum Status { pending, confirmed }

class Transactions {
  DateTime date;
  Status status;
  double amount;

  String paidTo;

  Category category;

  bool get isConfirmed => (status == Status.confirmed);
  String get dateName {
    if (date == null) {
      return '';
    }

    return '${date.month < 10 ? "0" : ""}${date.month}\\${date.day < 10 ? "0" : ""}${date.day}\\${date.year}';
  }

  IconData get icon {
    return getIcon(this.category);
  }

  static IconData getIcon(Category category) {
    switch (category) {
      case Category.transportation:
        return Icons.airplanemode_active;
      case Category.food:
        return Icons.local_dining;
      case Category.others:
        return Icons.more_vert;
      default:
        return null;
    }
  }

  static Color getColor(Category category) {
    switch (category) {
      case Category.transportation:
        return Colors.red;
      case Category.food:
        return Colors.blue;
      case Category.others:
        return Colors.grey;
      default:
        return null;
    }
  }

  Transactions({
    this.date,
    this.status,
    this.amount,
    this.paidTo,
    this.category,
  });

  factory Transactions.fromMap(dynamic data) {
    data = data ?? {};
    return Transactions(
      date: data['date'],
      status: getStatus(data['status'] ?? ''),
    );
  }

  dynamic toMap() {
    return {
      'date': date,
      'status': getStatusName(),
      'amount': amount,
    };
  }

  static Status getStatus(String name) {
    if (name == 'Pending') {
      return Status.pending;
    } else {
      return Status.confirmed;
    }
  }

  String getStatusName() {
    switch (status) {
      case Status.pending:
        return 'Pending';
      case Status.confirmed:
        return 'Confirmed';
      default:
        return '';
    }
  }
}
