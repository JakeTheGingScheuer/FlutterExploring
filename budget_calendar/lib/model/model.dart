import 'package:flutter/foundation.dart';

class Transaction {
  final int id;
  double transactionAmount;

  Transaction({
    @required this.transactionAmount,
    @required this.id
  });

  Transaction copyWith({int transactionAmount}) {
    return Transaction(
        id: id ?? this.id,
        transactionAmount: transactionAmount ?? this.transactionAmount
    );
  }
}

class AppState{
  List<Transaction> transactions;
  double dailyBalance;

  AppState({
    @required this.transactions,
    @required this.dailyBalance
  });

  AppState.initialState() : 
        transactions = List.unmodifiable(<Transaction>[]),
        dailyBalance = 0.00;
  
}