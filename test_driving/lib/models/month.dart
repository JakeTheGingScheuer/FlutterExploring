import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiver/time.dart';
import 'day.dart';

class Month extends ChangeNotifier{
  List<Day> days = List<Day>();
  DateUtil dateUtil = DateUtil();
  String monthName;

  Month(int monthNumber) {
    int thisYear = DateTime.now().year;
    DateTime firstDayOfTheMonth = DateTime(thisYear, monthNumber);
    monthName = dateUtil.month(monthNumber);

    for(int i = 0; i< daysInMonth(thisYear, monthNumber); i++){
      DateTime time = firstDayOfTheMonth.add(new Duration(days: i));
      days.add(Day(time.day, time.weekday));
    }
  }
}