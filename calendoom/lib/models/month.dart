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

    Map<String, dynamic> map = new Map();
    map['monthName'] = monthName;
    map['year'] = year;

    Map<String, dynamic> daysMap = new Map();
    for(int i = 0; i<days.length; i++){
      String dayKey = days[i].dayTitle();
      Map<String,dynamic> dayJson = days[i].toJson();
      daysMap[dayKey] = dayJson;
    }
    map['days'] = daysMap;

    return map;
  }

  Month.fromJson(Map<String, dynamic> json){
    monthName = json['monthName'];
    year = json['year'];

    List<Day> dayList = new List<Day>();
    Map<String, dynamic> daysJson = json['days'];
  
    List<String> dayKeys = daysJson.keys.toList();

    for(int i =0; i<daysJson.length; i++){
      dayList.add(Day.fromJson(daysJson[dayKeys[i]]));
    }
    days = dayList;
  }
}