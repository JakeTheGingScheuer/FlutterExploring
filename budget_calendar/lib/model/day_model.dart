import 'dart:collection';

import 'package:flutter/material.dart';

class DayModel extends ChangeNotifier {
  final List<Transaction> _transactions = [];
  UnmodifiableListView<Transaction> get transactions => UnmodifiableListView(_transactions);

  double getDailyBalance() {
    double balance = 0.0;
    for(int i =0; i<_transactions.length; i++) {
      balance += _transactions[i].amount;
    }
    return balance;
  }

  void add(Transaction transaction) {
    _transactions.add(transaction);
    notifyListeners();
  }
}

@immutable
class Transaction {
  final int id;
  final String description;
  final double amount;

  Transaction(this.id, this.description, this.amount);
}