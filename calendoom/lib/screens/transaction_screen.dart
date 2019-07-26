import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localstorage/localstorage.dart';
import 'package:test_driving/models/transaction.dart';
import '../models/day.dart';

class TransactionScreen extends StatelessWidget {
  Transaction transaction;
  Day day;
  LocalStorage storage;
  TransactionScreen(this.transaction, this.day, this.storage);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        appBar: AppBar(title: Text('Transaction Screen')),
          body: Column(
            children: <Widget>[
              SizedBox(height: 40),
              Text('Description', style: TextStyle(fontSize: 20)),
              descriptionInput(transaction),
              Text('Amount', style: TextStyle(fontSize: 20)),
              amountInput(transaction),
              creditDebitSwitch(transaction),
              reoccurringSwitch(transaction),
              RaisedButton(
                child:Text('Add To Ledger'),
                key: Key('newTransaction'),
                onPressed: () => addTransactionButton(transaction, day, context),
              )
            ]
          )
      );
  }

  Container descriptionInput(Transaction transaction){
    return Container(
        padding: EdgeInsets.all(30),
        child:CupertinoTextField(
            placeholder: 'Rent, electric, payday, etc.',
            key: Key('descriptionInput'),
            onChanged: (input) => transaction.setDescription(input)));
  }

  Container amountInput(Transaction transaction) {
    return Container(
        padding: EdgeInsets.all(30),
        child: CupertinoTextField(
            prefix: Text('\$'),
            keyboardType: TextInputType.numberWithOptions(),
            placeholder: '0.00',
            key: Key('amountInput'),
            onChanged: (input) => transaction.setAmount(double.parse(input))));
  }

  Container creditDebitSwitch(Transaction transaction){
    return Container(
      padding: EdgeInsets.all(40),
      child: Row(
        children: <Widget>[
          Text('   (-)Debit/ (+)Credit                      '),
          CupertinoSwitch(
            key: Key('creditDebit'),
            value: transaction.isCredit,
            onChanged: (bool value) => transaction.setIsCredit(value)),
        ],
      )
        );
  }

  Container reoccurringSwitch(Transaction transaction){
    return Container(
        padding: EdgeInsets.all(40),
        child: Row(
            children: <Widget>[
              Text('   Reoccuring Payment                   '),
              CupertinoSwitch(
                key: Key('reoccuring'),
                value: transaction.isReoccurring,
                onChanged: (bool value) => transaction.setIsReoccurring(value))
        ])
    );
  }

  addTransactionButton(Transaction transaction, Day day, BuildContext context) {
    day.addTransaction(transaction);
    Navigator.pop(context);
  }
}