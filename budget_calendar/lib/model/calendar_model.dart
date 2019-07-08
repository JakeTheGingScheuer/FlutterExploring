import 'dart:collection';
import 'package:budget_calendar/model/day_model.dart';
import 'package:flutter/material.dart';

class CalendarModel extends ChangeNotifier {
  List<Day> _days = [];

  CalendarModel(){
    makeCalendar();
  }

  void makeCalendar() {
    DateTime today = DateTime.now();
    for(int i = 0; i<365; i++){
      DateTime dayOf = today.add(new Duration(days: i));
      _days.add(new Day(dayOf.month, dayOf.weekday, dayOf.day));
    }
  }

  UnmodifiableListView<Day> get days => UnmodifiableListView(_days);
}

class Day {
  DayModel dayModel = DayModel();
  CalendarDate calendarDate;

  Day(int monthNum, int weekdayNum, int dayNum) {
    calendarDate = new CalendarDate(monthNum, weekdayNum, dayNum);
  }
}


@immutable
class CalendarDate {
  String month;
  String weekday;
  int dayNum;

  CalendarDate(int monthNum, int weekdayNum, this.dayNum) {
    monthSymb(monthNum);
    weekdaySymb(weekdayNum);
  }

  String monthSymb(int monthNum) {
    switch (monthNum) {
      case 1:
        {
          return 'JAN';
        }
      case 2:
        {
          return 'FEB';
        }
      case 3:
        {
          return 'MAR';
        }
      case 4:
        {
          return 'APR';
        }
      case 5:
        {
          return 'MAY';
        }
      case 6:
        {
          return 'JUN';
        }
      case 7:
        {
          return 'JUL';
        }
      case 8:
        {
          return 'AUG';
        }
      case 9:
        {
          return 'SEP';
        }
      case 10:
        {
          return 'OCT';
        }
      case 11:
        {
          return 'NOV';
        }
      case 12:
        {
          return 'DEC';
        }
    }
  }

  String weekdaySymb(int weekdayNum) {
    switch(weekdayNum) {
      case 1:{
        return 'Mon ';
      }
      case 2:{
        return 'Tue ';
      }
      case 3:{
        return 'Wed ';
      }
      case 4:{
        return 'Thu ';
      }
      case 5:{
        return 'Fri ';
      }
      case 6:{
        return 'Sat ';
      }
      case 7:{
        return 'Sun ';
      }
    }
  }
}