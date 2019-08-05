import 'package:flutter/cupertino.dart';
import 'month.dart';

class Calendar extends ChangeNotifier {
  List<Month> months;

  Calendar() {
    months = makeCalendarModel();
  }

  List<Month> makeCalendarModel(){
    List<Month> monthsBuilding = new List<Month>();
    DateTime date = DateTime.now();
    if(date.month == 1) {
      monthsBuilding.add(Month(date.year - 1, 12));
    }else{
      monthsBuilding.add(Month(date.year, date.month - 1));
    }

    for(int i = 0; i<13; i++){
      if((date.month+i) > 12){
        monthsBuilding.add(Month(date.year+1, date.month+i-12));
      }else {
        monthsBuilding.add(Month(date.year, date.month + i));
      }
    }
    return monthsBuilding;
  }

  Map<String,dynamic> toJson() {

    Map<String, dynamic> map = new Map();

    Map<String, dynamic> monthsMap = new Map();
    for(int i = 0; i < months.length; i++){
      String monthKey = months[i].monthKey();
      Map<String,dynamic> monthJson = months[i].toJson();
      monthsMap[monthKey] = monthJson;
    }
    map['months'] = monthsMap;

    return map;
  }

  void calculateBalance(){
    months.forEach((month)=> month.days.forEach((day)=> day.calculateBalance()));
    notifyListeners();
  }

  Calendar.fromJson(Map<String, dynamic> json){
    List<Month> monthList = new List<Month>();
    Map<String, dynamic> monthsJson = json['months'];
    List<String> monthKeys = monthsJson.keys.toList();
    DateTime loadingDate = DateTime.now();

    bool toDate = false;
    for (int i = 0; i < monthsJson.length; i++) {
      Month monthFromJson = Month.fromJson(monthsJson[monthKeys[i]]);
      if (toDate) {
        monthList.add(monthFromJson);
      }
      if(loadingDate.month-1 == monthFromJson.monthNumber) {
        toDate = true;
        monthList.add(monthFromJson);
      }
    }
    months = monthList;
    if(months.length < monthsJson.length){
      DateTime endingDate = loadingDate.add(Duration(days: 400));
      monthList.add(Month(endingDate.year, endingDate.month));
    }
    calculateBalance();
  }
}