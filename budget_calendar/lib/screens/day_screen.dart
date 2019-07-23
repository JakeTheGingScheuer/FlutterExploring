import 'package:budget_calendar/model/day_model.dart';
import 'package:budget_calendar/screens/transaction_screen.dart';
import 'package:budget_calendar/widgets/transaction.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:flutter/material.dart';


class DayScreen extends StatelessWidget{
  DayModel day;

  DayScreen(this.day);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common.headBar(day.dayTitle()),
        body: Column(
          children: <Widget>[
            TransactionList(this.day),
            RaisedButton(
                child: Text('New Transaction'),
                color: Colors.blue,
                textColor: Colors.white,
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => TransactionScreen(this.day))
                )
            )
          ]
        ),
    );
  }
}

class TransactionList extends StatelessWidget{
  DayModel dayModel;

  TransactionList(this.dayModel);

  @override
  Widget build(BuildContext context) {
    List<ListTile> transactionTiles = makeTransactionTiles(this.dayModel.transactions);
    return
      Container(
          height: 400,
          child: ListView(
          children: transactionTiles
      ));
  }

  List<ListTile> makeTransactionTiles(List<Transaction> transactions){
    List<ListTile> transactionTiles = List<ListTile>();

    for(int i = 0;i<transactions.length; i++) {
        transactionTiles.add(
            ListTile(
                title: Text(transactions[i].amount.toString()),
                subtitle: Text(transactions[i].description),
                leading: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => this.dayModel.deleteTrans(transactions[i])
                )
            ));
      } return transactionTiles;
    }

}