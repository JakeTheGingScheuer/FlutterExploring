import 'package:budget_calendar/model/day_model.dart';
import 'package:flutter/material.dart';

class CalendarModel with ChangeNotifier {
  List<DayModel> allDayModels = [];

  CalendarModel(){
    makeCalendar();
  }

  void makeCalendar() {
    DateTime today = DateTime.now();
    for(int i = 0; i<365; i++){
      DateTime dayOf = today.add(new Duration(days: i));
      allDayModels.add(new DayModel(dayOf.month, dayOf.weekday, dayOf.day));
    }
  }
}