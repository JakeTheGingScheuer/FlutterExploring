import 'package:flutter/material.dart';
import 'calendar_day.dart';

class CalendarMonth extends StatelessWidget {
  List<CalendarDay> month;

  CalendarMonth() {
    month = new List<CalendarDay>();
    makeCalendar(200);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          maxHeight: 400
        ),
        child:
          GridView.count(
            mainAxisSpacing: 3.0,
            crossAxisSpacing: 3.0,
            crossAxisCount: 7,
            children: month
        )
    );
  }

  void makeCalendar(int num) {
    for(int i = 0; i<num; i++){
      month.add(CalendarDay('Monday'));
    }
  }
}
