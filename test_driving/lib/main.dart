import 'package:flutter/material.dart';
import 'package:test_driving/transaction.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Hi HDAWG!')),
        body: TransactionWidget(Transaction()),
      )
    );
  }
}

class TransactionWidget extends StatelessWidget {
  Transaction transaction;

  TransactionWidget(this.transaction);

  @override
  Widget build(BuildContext context) {
    return Text(transaction.value.toStringAsPrecision(3));
  }

}
