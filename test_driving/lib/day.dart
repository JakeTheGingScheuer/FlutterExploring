import 'package:flutter/cupertino.dart';
import 'package:test_driving/transaction.dart';

class Day extends ChangeNotifier {
  List<Transaction> transactions = List<Transaction>();

  double balance = 0.00;

  double getBalance() {
    return this.balance;
  }

  void addTransaction() {
    transactions.add(Transaction());
  }

  void deleteTransaction(Transaction transaction) {
    transactions.remove(transaction);
  }
}