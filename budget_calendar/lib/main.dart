import 'package:budget_calendar/screens/calendar_screen.dart';
import 'package:budget_calendar/screens/day_screen.dart';
import 'package:budget_calendar/screens/transaction_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model/calendar_model.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => CalendarModel(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title:'CaLeNdOom',
        initialRoute: '/',
        routes: {
          '/': (context) => CalendarScreen(),
          '/day': (context) => DayScreen(),
          '/transaction': (context) => TransactionScreen()
        }));
  }
}