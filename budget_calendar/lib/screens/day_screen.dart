import 'package:budget_calendar/screens/transaction_screen.dart';
import 'package:budget_calendar/widgets/app_bar.dart';
import 'package:budget_calendar/widgets/transaction_list.dart';
import 'package:flutter/material.dart';

class DayScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: Common.headBar(),
        body: TransactionList(),
      floatingActionButton: new FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => TransactionScreen()
          ));
        },
      ),
    );
  }
}