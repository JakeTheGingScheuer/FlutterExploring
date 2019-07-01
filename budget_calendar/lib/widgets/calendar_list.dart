import 'package:budget_calendar/screens/day_screen.dart';
import 'package:flutter/material.dart';
import 'calendar_day_presenter.dart';

class CalendarList extends StatelessWidget {
  List<CalendarDay> dayTiles;

  CalendarList() {
    dayTiles = new List<CalendarDay>();
    makeCalendar();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 365,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => DayScreen()
          ));
        },
        child:ListTile(
          contentPadding: EdgeInsets.all(10.0),
          leading: this.dayTiles[index],
          title: Text('balance goes here'),
          subtitle: Text('credits and debits go here'),
        ));}
    );
  }

  void makeCalendar() {
    DateTime today = DateTime.now();
    for(int i = 0; i<365; i++){
      DateTime dayOf = today.add(new Duration(days: i));
      dayTiles.add(new CalendarDay(dayOf.month, dayOf.weekday, dayOf.day));
    }
  }
}
