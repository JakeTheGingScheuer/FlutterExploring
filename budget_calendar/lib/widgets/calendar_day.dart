import 'package:budget_calendar/screens/day_detail.dart';
import 'package:flutter/material.dart';

class CalendarDay extends StatelessWidget {

  String day;

  CalendarDay(this.day);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => DayDetail()
        ));
      },
      child: Container(
        color: Colors.blue,
          child: Text(day, textAlign: TextAlign.center),
          alignment: Alignment(0,0)
      )
    );
  }
}