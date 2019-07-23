import 'dart:convert';

import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_driving/models/transaction.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Day extends ChangeNotifier {
  List<Transaction> transactions = List<Transaction>();

  double credits = 0.00;
  double debits = 0.00;
  double balance = 0.00;
  int weekdayNumber;
  String month;
  String dayNumber;
  String weekday;

  Day(int monthNum, int dayNum, int weekdayNum) {
    DateUtil date = DateUtil();
    weekdayNumber = weekdayNum;
    month = date.month(monthNum);
    dayNumber = dayNum.toString();
    weekday = date.day(weekdayNum + 2);
  }

  void calculateBalance() {
    int i = 0;
    while(transactions.length>i){
      if(transactions[i].isCredit){
        credits += transactions[i].value;
      } else {
        debits += transactions[i].value;
      }
      i++;
    }
    balance = credits + debits;
    notifyListeners();
  }

  void addTransaction(Transaction transaction) {
    transactions.add(transaction);
    calculateBalance();
    notifyListeners();
  }

  void deleteTransaction(Transaction transaction) {
    transactions.remove(transaction);
    calculateBalance();
    notifyListeners();
  }
//  void saveDay() async{
//    final String dayKey = 'dayKeyUsedForAcessingIO';
//    SharedPreferences sp = await SharedPreferences.getInstance();
//    sp.setString(dayKey, json.encode(transactions));
//  }
}