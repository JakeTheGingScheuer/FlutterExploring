import 'package:budget_calendar/widgets/transaction_form.dart';
import 'package:budget_calendar/widgets/app_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TransactionList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return TransactionListState();
  }
}

class TransactionListState extends State {
  List<ListTile> transactionList;

  TransactionListState(){
    transactionList = new List<ListTile>();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
          children: transactionList,
        )
    );
  }
}