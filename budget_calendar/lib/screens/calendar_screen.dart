import 'package:budget_calendar/widgets/calendar_month.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('CALENDOOM'),
          backgroundColor: Colors.red
      ),
      body: calendarMonth(),
    );
  }
}