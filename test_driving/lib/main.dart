import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/transaction.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/transaction_widget.dart';

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
