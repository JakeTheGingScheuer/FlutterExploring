import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:quiver/time.dart';
import 'day.dart';

class Month extends ChangeNotifier{
  List<Day> days = List<Day>();
  DateUtil dateUtil = DateUtil();
  String monthName;

  Month() {
    int month = DateTime.now().month;
    int year = DateTime.now().year;
    monthName = dateUtil.month(DateTime.now().month);
    for(int i = 0; i< daysInMonth(year, month); i++){
      days.add(Day());
    }
  }
}