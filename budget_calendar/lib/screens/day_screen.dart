import 'package:budget_calendar/model/day_model.dart';
import 'package:budget_calendar/screens/transaction_screen.dart';
import 'package:budget_calendar/widgets/Transaction.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:flutter/material.dart';


class DayScreen extends StatelessWidget{
  DayModel dayModel;

  DayScreen(this.dayModel);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common.headBar(),
        body: TransactionList(this.dayModel),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: RaisedButton(
          child: Text('New Transaction'),
          color: Colors.red,
          onPressed: () => Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => TransactionScreen(this.dayModel))
          )
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
    return ListView(
        children: transactionTiles
    );
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