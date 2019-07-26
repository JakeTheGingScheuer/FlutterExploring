import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'month.dart';

class Calendar extends ChangeNotifier {
  List<Month> months;

  Calendar() { months = makeCalendarModel(); }

  List<Month> makeCalendarModel(){
    List<Month> monthsBuilding = new List<Month>();
    DateTime date = DateTime.now();

    if(date.month == 1) {
      monthsBuilding.add(Month(date.year - 1, 12));
    }else{
      monthsBuilding.add(Month(date.year, date.month - 1));
    }

    for(int i = 0; i<13; i++){
      if(date.month+i > 12){
        monthsBuilding.add(Month(date.year+1, date.month+i-12));
      }else {
        monthsBuilding.add(Month(date.year, date.month + i));
      }
    }
    return monthsBuilding;
  }

  Map<String,dynamic> toJson() {

    Map<String,dynamic> json = Map<String,dynamic>();
    months.forEach((month) => json.putIfAbsent(month.monthName, () => month.toJson()));
    return json;
  }

  Calendar.fromJson(Map<String, dynamic> json){
    months = new List<Month>();
    json.values.forEach((month) => months.add(Month.fromJson(month)));
  }
}