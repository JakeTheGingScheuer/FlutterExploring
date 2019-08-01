import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/transaction.dart';
import 'package:test_driving/screens/transaction_screen.dart';
import '../models/day.dart';

class DayScreen extends StatefulWidget {
  Day day;
  DayScreen(this.day);

  @override
  State<StatefulWidget> createState() => DayScreenState(day);
}

class DayScreenState extends State<DayScreen>{
  Day day;
  DayScreenState(this.day);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CupertinoNavigationBar(middle:Text(day.dayTitle(),style: TextStyle(color: Colors.green),), actionsForegroundColor: Colors.green, backgroundColor: Colors.black),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            SizedBox(height: 15),
            SizedBox(height: 15),
            Container(
                key: Key('transactionList'),
                height:400,
                child: transactionList(day)),
            CupertinoButton(
                key: Key('newTransaction'),
                child: Text('New Transaction'),
                color: Colors.green,
                onPressed: () => addNewTransaction(day, context))
          ],
        ),
      )
    );
  }

  addNewTransaction(Day day, BuildContext context) {
    Transaction transaction = Transaction();
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => TransactionScreen(transaction, day)));
  }

  ListView transactionList(Day day) {
    List<Container> tiles = List<Container>();

    day.transactions.forEach((trans) =>
        tiles.add(transactionTile(trans.description, trans.value)));
    return ListView(
      children: tiles
    );
  }

  Container transactionTile(String description, double value){
    return Container(
      decoration: BoxDecoration(border: Border.all(color: Colors.green), borderRadius: BorderRadius.all(Radius.circular(10))),
      child: ListTile(
        contentPadding: EdgeInsets.all(5),
        title: Container(child: Text(description,style: TextStyle(color: Colors.white70))),
        trailing: Container(child: Text(value.toStringAsFixed(2), style: TextStyle(color: Colors.green))),
      ),
    );
  }
}