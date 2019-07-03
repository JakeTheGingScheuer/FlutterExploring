import 'package:budget_calendar/model/model.dart';
import 'package:budget_calendar/model/view_model.dart';
import 'package:budget_calendar/screens/transaction_screen.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:flutter/material.dart';

class DayScreen extends StatelessWidget{
  ViewModel mainModel;
  DayScreen(this.mainModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common.headBar(),
        body: TransactionList(mainModel),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton:
        RaisedButton(
          child: Text('Add Transaction'),
          highlightColor: Colors.red,
          color: Colors.red,
          onPressed: () => Navigator.push(context, MaterialPageRoute(
              builder: (context) => TransactionScreen(mainModel)
          ))
        ),
    );
  }
}

class TransactionList extends StatelessWidget{
  final ViewModel mainModel;

  TransactionList(this.mainModel);

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: mainModel.transactions.map((Transaction transaction) => ListTile(
        title: Text(transaction.transactionAmount.toString()),
        leading: IconButton(
          icon: Icon(Icons.delete),
            onPressed: () => mainModel.onRemoveTransaction(transaction)
        )
      )).toList()
    );
  }


  Text checkIfNull(int index){
    if(mainModel.transactions.length>index){
      return Text(mainModel.transactions[index].transactionAmount.toString());
    }
    else return Text('');
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