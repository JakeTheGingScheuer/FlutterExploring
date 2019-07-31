import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_driving/models/transaction.dart';

class Day extends ChangeNotifier {
  List<Transaction> transactions;

  double credits = 0.00;
  double debits = 0.00;
  double balance = 0.00;
  int weekdayNumber;
  String month;
  String dayNumber;
  String weekday;

  Day(int monthNum, int dayNum, int weekdayNumber) {
    DateUtil date = DateUtil();
    this.weekdayNumber = weekdayNumber;
    month = date.month(monthNum);
    dayNumber = dayNum.toString();
    weekday = date.day(weekdayNumber + 2);
    transactions = List<Transaction>();
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
    Map<String, dynamic> map = new Map();
    map['month'] = month;
    map['dayNumber'] = dayNumber;
    map['weekdayNumber'] = weekdayNumber;
    map['weekday'] = weekday;

    Map<String, dynamic> transactionMap = new Map();
    for(int i = 0; i<transactions.length; i++){
      String transNumber = i.toString();
      Map<String,dynamic> transactionJson = transactions[i].toJson();
      transactionMap[transNumber] = transactionJson;
    }
    map['transactions'] = transactionMap;

    return map;
  }

  String dayTitle(){
    return weekday+' '+month+' '+dayNumber;
  }

  Day.fromJson(Map<String,dynamic> json){
    month = json['month'];
    dayNumber = json['dayNumber'];
    weekdayNumber = json['weekdayNumber'];
    weekday = json['weekday'];

    List<Transaction> transactionList = new List<Transaction>();
    Map<String, dynamic> transactionsJson = json['transactions'];

    for(int i =0; i<transactionsJson.length; i++){
      String transactionKey = i.toString();
      transactionList.add(
          Transaction.fromJson(transactionsJson[transactionKey]));
    }
    transactions = transactionList;
  }
}