import 'package:budget_calendar/styles.dart';
import 'package:budget_calendar/widgets/calendar_month.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('CALENDOOM', style: Styles.headerLarge),
          backgroundColor: Colors.red
      ),
      body: CalendarMonth()
    );
  }
}