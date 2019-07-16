import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/day.dart';
import 'package:test_driving/transaction.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/transaction_widget.dart';

import 'day_widget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (context) => Day(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => DayWidget()
          })
      );
  }
}
