import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/models/transaction.dart';
import 'package:test_driving/screens/transaction_screen.dart';
import '../models/day.dart';

class DayScreen extends StatelessWidget {
  Day day;
  DayScreen(this.day);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title:Text('Day Screen')),
      body: Column(
        children: <Widget>[
          Container(
              key: Key('transactionList'),
              height:400,
              child: transactionList(day)),
          RaisedButton(
              key: Key('newTransaction'),
              child: Text('New Transaction'),
              onPressed: () => addNewTransaction(day, context))
        ],
      )
    );
  }

  addNewTransaction(Day day, BuildContext context) {
    Transaction transaction = Transaction();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TransactionScreen(transaction, day)));
  }

  ListView transactionList(Day day) {
    List<ListTile> tiles = List<ListTile>();
    day.transactions.forEach((trans) =>
        tiles.add(transactionTile(trans.description, trans.value)));
    return ListView(
      children: tiles
    );
  }

  ListTile transactionTile(String description, double value){
    return ListTile(
      title: Text(description),
      leading: Text(value.toStringAsFixed(2)),
    );
  }
}