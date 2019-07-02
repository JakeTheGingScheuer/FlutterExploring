import 'package:budget_calendar/model/model.dart';
import 'package:budget_calendar/screens/transaction_screen.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:flutter/material.dart';

import 'calendar_screen.dart';

class DayScreen extends StatelessWidget{
  ViewModel model;
  DayScreen(this.model);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common.headBar(),
        body: TransactionList(model),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => TransactionScreen(model)
          ));
        },
      ),
    );
  }
}

class TransactionList extends StatelessWidget{
  ViewModel model;

  TransactionList(this.model);

  @override
  Widget build(BuildContext context) {
    return ListView(
          children: model.transactions.map((Transaction transaction) => ListTile(
            title: Text(transaction.transactionAmount.toString()),
            leading: IconButton(
              icon: Icon(Icons.delete),
              onPressed: () => model.onRemoveTransaction(transaction)
            )
          )).toList()
    );
  }
}

class ClearBalanceButton extends StatelessWidget {
  final ViewModel model;

  ClearBalanceButton(this.model);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text('Delete all transactions'),
      onPressed: () => model.onResetBalance(),
    );
  }


}