import 'package:budget_calendar/widgets/app_bar.dart';
import 'package:budget_calendar/widgets/calendar_list.dart';
import 'package:flutter/material.dart';

class CalendarScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Common.headBar(),
      body: CalendarList()
    );
  }
}