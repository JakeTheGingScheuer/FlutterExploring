import 'package:budget_calendar/redux/actions.dart';
import 'package:redux/redux.dart';

import 'model.dart';

class ViewModel {
  double dailyBalance;
  List<Transaction> transactions;
  Function(double) onAddTransaction;
  Function(Transaction) onRemoveTransaction;
  Function() onResetBalance;
  Function(double) onUpdateBalance;

  ViewModel({
    this.dailyBalance,
    this.transactions,
    this.onAddTransaction,
    this.onRemoveTransaction,
    this.onResetBalance,
    this.onUpdateBalance
  });

  factory ViewModel.create(Store<AppState> store) {
    _onAddTransaction(double transAmount) {
      store.dispatch(AddTransactionAction(transAmount));
    }
    _onRemoveTransaction(Transaction transaction) {
      store.dispatch(RemoveTransactionAction(transaction));
    }
    _onResetBalance() {
      store.dispatch(ClearBalanceAction());
    }
    _onUpdateBalance(double balance) {
      store.dispatch(UpdateBalanceAction(balance));
    }
    return ViewModel(
        dailyBalance: store.state.dailyBalance,
        transactions: store.state.transactions,
        onAddTransaction: _onAddTransaction,
        onRemoveTransaction: _onRemoveTransaction,
        onResetBalance: _onResetBalance,
        onUpdateBalance: _onUpdateBalance
    );
  }
}