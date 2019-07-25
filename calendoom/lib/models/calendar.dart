import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'month.dart';

class Calendar extends ChangeNotifier {
  List<Month> months;

  Calendar({Map<String, Month> monthsFromDisk}) {
    if (monthsFromDisk != null) {
      monthsFromDisk.values.forEach((month) => months.add(month));
    } else {
      months = makeCalendarModel();
    }
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
      if(date.month+i > 12){
        monthsBuilding.add(Month(date.year+1, date.month+i-12));
      }else {
        monthsBuilding.add(Month(date.year, date.month + i));
      }
    }
    return monthsBuilding;
  }

    encode() {
      Map<String, dynamic> fileToSave = new Map();
      JsonCodec codec = JsonCodec();
      months.forEach((month) =>
      fileToSave[month.monthName + month.year] = month.encode());
      String json = codec.encode(fileToSave);
      return json;
    }

    decode(String jsonFile){
    }
}