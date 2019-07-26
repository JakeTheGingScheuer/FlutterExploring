import 'dart:convert';

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

  Map<String,dynamic> toJson() {
    Map<String,dynamic> monthJson = Map<String,dynamic>();
    monthJson.putIfAbsent('monthName', ()=> monthName);
    monthJson.putIfAbsent('year', ()=> year);
    days.forEach((day) => monthJson.putIfAbsent(day.dayTitle(), () => day.toJson()));

    return monthJson;
  }
  Month.fromJson(Map<String, dynamic> json){
    days = new List<Day>();
    monthName = json['monthName'];
    year = json['year'];

    json.values.skip(2).forEach((day) =>
        days.add(Day.fromJson(day)));
  }
}