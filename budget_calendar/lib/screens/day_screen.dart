import 'package:budget_calendar/model/day_model.dart';
import 'package:budget_calendar/widgets/common.dart';
import 'package:flutter/material.dart';

class DayScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common.headBar(),
        body: TransactionList(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: RaisedButton(
        child: Text('New Transaction'),
        color: Colors.red,
        onPressed: () => Navigator.pushReplacementNamed(context, '/transaction')
      ),
    );
  }
}

class TransactionList extends StatelessWidget{
  DayModel day;
  List<ListTile> transactionTiles;

  TransactionList() {
    day = DayModel();
    makeDayView();
  }

  void makeDayView(){
    var ledger = day.transactions;
    for(int i = 0;i<ledger.length; i++) {
        transactionTiles.add(
            ListTile(
                title: Text(ledger[i].amount.toString()),
                subtitle: Text(ledger[i].description),
                leading: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => ledger.remove(ledger[i])
                )
            ));
      }
    }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: transactionTiles
    );
  }
}