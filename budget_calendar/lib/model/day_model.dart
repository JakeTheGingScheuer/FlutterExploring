import 'package:budget_calendar/widgets/Transaction.dart';
import 'package:flutter/material.dart';

class DayModel with ChangeNotifier {
  List<Transaction> transactions = [];

  double getDailyBalance() {
    double balance = 0.0;
    for(int i =0; i<transactions.length; i++) {
      balance += transactions[i].amount;
    }
    return balance;
  }

  void addTrans(String description, double amount) {
    transactions.add(Transaction(description, amount));
    notifyListeners();
  }

  void deleteTrans(Transaction transaction) {
    this.transactions.remove(transaction);
    notifyListeners();
  }
}