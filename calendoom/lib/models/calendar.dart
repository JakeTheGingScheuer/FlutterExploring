import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/balance_calculator.dart';
import 'package:test_driving/models/calendar_builder.dart';
import 'package:test_driving/models/calendar_builder.dart' as prefix0;
import 'package:test_driving/models/transaction.dart';
import 'day.dart';
import 'month.dart';

class Calendar extends ChangeNotifier {
  List<Month> months;
  BalanceCalculator balanceData;

  Calendar() {
    CalendarBuilder builder = new CalendarBuilder();
    months = builder.getMonths();
    update();
  }

  update(){
    balanceData = BalanceCalculator(months);
  }

  Map<String,dynamic> toJson() {

    Map<String, dynamic> calendarJson = new Map();
    Map<String, dynamic> monthsMap = new Map();

    months.forEach((month) => monthsMap[month.monthKey()] = month.toJson());

    calendarJson['months'] = monthsMap;

    return calendarJson;
  }

  Calendar.fromJson(Map<String, dynamic> json){
    months = new List<Month>();
    DateTime creationDate = DateTime.now();
    Map<String, dynamic> monthsJson = json['months'];
    List<String> monthKeys = monthsJson.keys.toList();
    int totalMonthsSaved = monthsJson.length;

    bool upToDate = false;

    for (int i = 0; i < totalMonthsSaved; i++) {
      Month monthOnFile = Month.fromJson(monthsJson[monthKeys[i]]);

      bool monthOnFileIsLastMonth = creationDate.month-1 == monthOnFile.monthNumber;

      if(!upToDate && monthOnFileIsLastMonth) {
        upToDate = true;
      }

      if (upToDate) {
        months.add(monthOnFile);
      }
    }

    if(months.length < totalMonthsSaved){
      DateTime endingDate = creationDate.add(Duration(days: 400));
      months.add(Month(endingDate.year, endingDate.month));
    }
    update();
  }
}