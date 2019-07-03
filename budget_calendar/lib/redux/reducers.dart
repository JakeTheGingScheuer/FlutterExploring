import 'dart:core';
import 'package:budget_calendar/model/model.dart';
import 'package:budget_calendar/redux/actions.dart';

AppState appStateReducer(AppState state, action) {
  return AppState(
    dailyBalance: balanceReducer(state.transactions, action),
    transactions: itemReducer(state.transactions, action)
  );
}

double balanceReducer(List<Transaction> state, action) {
  double balance = 0.00;
  if (action is UpdateBalanceAction) {
    for(int i = 0; i< state.length; i++) {
      balance += state[i].transactionAmount;
    }
  }
  return balance;
}

List<Transaction> itemReducer(List<Transaction> state, action) {
  if(action is AddTransactionAction) {
    return []
        ..addAll(state)
        ..add(Transaction(id: action.id, transactionAmount: action.transAmount));
  }
  if (action is RemoveTransactionAction) {
    return List.unmodifiable(List.from(state)..remove(action.transaction));
  }
  if (action is ClearBalanceAction) {
    return List.unmodifiable([]);
  }
  return state;
}