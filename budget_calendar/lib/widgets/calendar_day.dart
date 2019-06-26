import 'package:budget_calendar/screens/calendar_screen.dart';
import 'package:budget_calendar/styles.dart';
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

class DayDetail extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      GestureDetector(
          onTap: () {
            Navigator.pop(context, MaterialPageRoute(
                builder: (context) => CalendarScreen()
            ));
          },
          child:Container(
            color: Colors.black,
            alignment: Alignment(0,0),
            child: Text('DO YOU WANNA DIE?!?', style: Styles.death)
          )
      )
    );
  }
}