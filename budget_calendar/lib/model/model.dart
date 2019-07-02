import 'package:flutter/foundation.dart';

class Transaction {
  final int id;
  int transactionAmount;

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

  AppState({
    @required this.transactions
  });

  AppState.initialState() : transactions = List.unmodifiable(<Transaction>[]);
}