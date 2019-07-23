import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiver/time.dart';
import 'day.dart';

class Month extends ChangeNotifier{
  List<Day> days = List<Day>();
  DateUtil dateUtil = DateUtil();
  String monthName;
  String year;

  Month(int thisYear, int monthNumber) {
    DateTime firstDayOfTheMonth = DateTime(thisYear, monthNumber);
    year = thisYear.toString();
    monthName = dateUtil.month(monthNumber);

    for(int i = 0; i< daysInMonth(thisYear, monthNumber); i++){
      DateTime time = firstDayOfTheMonth.add(new Duration(days: i));
      days.add(Day(time.month, time.day, time.weekday));
    }
  }
}