import 'package:flutter/cupertino.dart';
import 'package:test_driving/transaction.dart';

class Day extends ChangeNotifier {
  List<Transaction> transactions = List<Transaction>();

  double credits = 0.00;
  double debits = 0.00;
  double balance = 0.00;

  void calculateBalance() {
    int i = 0;
    while(transactions.length>i){
      if(transactions[i].isCredit){
        credits += transactions[i].value;
      } else {
        debits += transactions[i].value;
      }
      i++;
    }
    balance = credits + debits;
  }

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  void deleteTransaction(Transaction transaction) {
    transactions.remove(transaction);
  }
}