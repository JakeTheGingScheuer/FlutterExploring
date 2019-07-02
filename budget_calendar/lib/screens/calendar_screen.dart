import 'package:budget_calendar/model/model.dart';
import 'package:budget_calendar/redux/actions.dart';
import 'package:budget_calendar/widgets/calendar_day_presenter.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';

import 'day_screen.dart';

class CalendarScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.headBar(),
      body: StoreConnector<AppState, ViewModel>(
        converter: (Store<AppState> store) => ViewModel.create(store),
        builder: (BuildContext context, ViewModel viewModel) => Container(
          child: CalendarList(viewModel))
        )
      );
  }
}

class ViewModel {
  List<Transaction> transactions;
  Function(int) onAddTransaction;
  Function(Transaction) onRemoveTransaction;
  Function() onResetBalance;

  ViewModel({
    this.transactions,
    this.onAddTransaction,
    this.onRemoveTransaction,
    this.onResetBalance
});

  factory ViewModel.create(Store<AppState> store) {
    _onAddTransaction(int transAmount) {
      store.dispatch(AddTransactionAction(transAmount));
    }
    _onRemoveTransaction(Transaction transaction) {
      store.dispatch(RemoveTransactionAction(transaction));
    }
    _onResetBalance() {
      store.dispatch(ClearBalanceAction());
    }
    return ViewModel(
      transactions: store.state.transactions,
      onAddTransaction: _onAddTransaction,
      onRemoveTransaction: _onRemoveTransaction,
      onResetBalance: _onResetBalance
    );
  }
}

class CalendarList extends StatelessWidget {
  final ViewModel model;
  List<CalendarDay> dayTiles;

  CalendarList(this.model) {
    dayTiles = new List<CalendarDay>();
    makeCalendar();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 365,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => DayScreen(model)
                ));
              },
              child:ListTile(
                contentPadding: EdgeInsets.all(10.0),
                leading: this.dayTiles[index],
                title: checkIfNull(index),
                subtitle: Text('credits and debits go here'),
              ));}
    );
  }

  Text checkIfNull(int index){
    if(model.transactions.length>index){
      return Text(model.transactions[index].transactionAmount.toString());
    }
    else return Text('');
  }

  void makeCalendar() {
    DateTime today = DateTime.now();
    for(int i = 0; i<365; i++){
      DateTime dayOf = today.add(new Duration(days: i));
      dayTiles.add(new CalendarDay(dayOf.month, dayOf.weekday, dayOf.day));
    }
  }
}