import 'package:flutter/cupertino.dart';
import 'month.dart';

class Calendar extends ChangeNotifier {
  List<Month> months = List<Month>();

  Calendar(){
    DateTime date = DateTime.now();
    if(date.month == 1) {
      months.add(Month(date.year - 1, 12));
    }else{
      months.add(Month(date.year, date.month - 1));
    }

    for(int i = 0; i<13; i++){
      if(date.month+i > 12){
        months.add(Month(date.year+1, date.month+i-12));
      }else {
        months.add(Month(date.year, date.month + i));
      }
    }
  }
}