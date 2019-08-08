import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/transaction.dart';
import 'package:test_driving/widgets/credit_button.dart';
import 'package:test_driving/widgets/reoccurring_button.dart';
import '../models/day.dart';

class TransactionScreen extends StatelessWidget {
  Transaction transaction;
  Day day;

  TransactionScreen(this.transaction, this.day);

  @override
  Widget build(BuildContext context) {
    return
      Scaffold(
        backgroundColor: Colors.black,
        appBar: CupertinoNavigationBar(middle: Text('New Transaction', style: TextStyle(color: Colors.green),), actionsForegroundColor: Colors.green, backgroundColor: Colors.black),
              body: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                    SizedBox(height: 40),
                    amountInput(transaction),
                    descriptionInput(transaction),
                    SizedBox(height: 40),
                    CreditButton(transaction),
                    SizedBox(height: 20),
                    ReoccurringButton(transaction),
                    SizedBox(height:40),
                    CupertinoButton(
                      child:Text('Add To Ledger'),
                      color: Colors.green,
                      key: Key('newTransaction'),
                      onPressed: () => addTransactionButton(transaction, day, context),
              )
            ]
          )
      ));
  }

  Container descriptionInput(Transaction transaction){
    return Container(
        padding: EdgeInsets.all(30),
        child:CupertinoTextField(
            style: TextStyle(color: Colors.greenAccent),
            cursorColor: Colors.green,
            placeholder: ' Description',
            key: Key('descriptionInput'),
            onChanged: (input) => transaction.setDescription(input)));
  }

  Container amountInput(Transaction transaction) {
    return Container(
        padding: EdgeInsets.all(30),
        child: CupertinoTextField(
            style: TextStyle(color: Colors.greenAccent),
            cursorColor: Colors.green,
            prefix: Text(' \$', style: TextStyle(color: Colors.green),),
            keyboardType: TextInputType.numberWithOptions(),
            placeholder: 'Amount',
            key: Key('amountInput'),
            onChanged: (input) => transaction.setAmount(double.parse(input))));
  }


  addTransactionButton(Transaction transaction, Day day, BuildContext context) {
    day.addTransaction(transaction);
    Navigator.pop(context);
  }
}

