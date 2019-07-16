import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/transaction.dart';
import 'package:test_driving/transaction_widget.dart';

import 'day.dart';

class DayWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    Day day = Provider.of<Day>(context);

    return Scaffold(
      appBar: AppBar(title:Text('Day Widget')),
      body: Column(
        children: <Widget>[
          RaisedButton(
              key: Key('newTransaction'),
              onPressed: () => addNewTransaction(day, context))
        ],
      )
    );
  }

  Function addNewTransaction(Day day, BuildContext context) {
    Transaction transaction = Transaction();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TransactionWidget(transaction, day)));
  }
}