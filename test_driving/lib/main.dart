import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/transaction.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (context) => Transaction(),
      child: MaterialApp(
          home: Scaffold(
            appBar: AppBar(title: Text('Hi HDAWG!')),
            body: TransactionWidget(),
          )
      )
    );
  }
}

class TransactionWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    Transaction transaction = Provider.of<Transaction>(context);

    return Column(
        children: <Widget>[
          Text(transaction.description),
          CupertinoTextField(
            onChanged: (input) => transaction.setDescription(input),
          ),
          Text(transaction.value.toStringAsPrecision(3))
        ],
      );
  }

}
