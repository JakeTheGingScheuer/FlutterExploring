import 'package:budget_calendar/model/model.dart';

class AddTransactionAction {
  static int _id = 0;
  double transAmount = 0;
  AddTransactionAction(this.transAmount){
    _id++;
  }

  int get id => _id;
}

class RemoveTransactionAction {
  final Transaction transaction;
  RemoveTransactionAction(this.transaction);
}

class ClearBalanceAction {}

class UpdateBalanceAction {
  double balance = 0.00;
  UpdateBalanceAction(this.balance);
}