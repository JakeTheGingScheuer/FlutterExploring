import 'dart:convert';

import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_driving/models/transaction.dart';

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


  Map<String,dynamic> toJson() {

    Map<String,dynamic> dayJson =
        Map<String,dynamic>();
    dayJson.putIfAbsent('month', ()=> month);
    dayJson.putIfAbsent('dayNumber', ()=> dayNumber);
    dayJson.putIfAbsent('weekdayNum', ()=> weekdayNumber);
    dayJson.putIfAbsent('weekday', ()=> weekday);

    for(int i = 0; i<transactions.length; i++){
      String transNumber = i.toString();
      Map<String,dynamic> transaction = transactions[i].toJson();
      dayJson.putIfAbsent(transNumber, () => transaction);
    }
    return dayJson;
  }

  String dayTitle(){
    return weekday+' '+month+' '+dayNumber;
  }

  Day.fromJson(Map<String,dynamic> json){
    month = json['month'];
    dayNumber = json['dayNumber'];
    weekdayNumber = json['weekdayNum'];
    weekday = json['weekday'];
    transactions = new List<Transaction>();
    json.values.skip(4).forEach((trans) =>
        transactions.add(Transaction.fromJson(trans)));
  }
}