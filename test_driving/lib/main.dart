import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/models/transaction.dart';
import 'package:provider/provider.dart';
import 'package:test_driving/screens/month_screen.dart';
import 'package:test_driving/screens/transaction_screen.dart';

import 'package:test_driving/screens/day_screen.dart';

import 'models/calendar.dart';
import 'models/month.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        builder: (context) => Calendar(),
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: '/',
          routes: {
            '/': (context) => MonthScreen(1)
          })
      );
  }
}
