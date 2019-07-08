import 'package:budget_calendar/model/calendar_model.dart';
import 'package:budget_calendar/widgets/common.dart';
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

class CalendarList extends StatelessWidget {
  CalendarModel calendar;
  List<Column> dayTiles;

  CalendarList() {
    calendar = CalendarModel();
    makeCalendarView();
  }

  void makeCalendarView() {
    var days = calendar.days;
    for (int i = 0; i < days.length; i++) {
        dayTiles.add(
            Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(days[i].calendarDate.month),
                  Text(days[i].calendarDate.weekday + ' ' +
                      days[i].calendarDate.dayNum.toString())
                ]
            )
        );
    }
  }

  String getRunningBalance(int i) {
    var theDay = calendar.days[i].dayModel;
    if(theDay.transactions.length>0) {
      return theDay.getDailyBalance().toString();
    } else return '0.00';
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 365,
        itemBuilder: (context, index) {
          return GestureDetector(
              onTap: () {
                Navigator.pushReplacementNamed(context, '/day');
              },
              child:ListTile(
                contentPadding: EdgeInsets.all(10.0),
                leading: this.dayTiles[index],
                title: Text(getRunningBalance(index)),
                subtitle: Text('credits and debits go here'),
              ));}
    );
  }
}