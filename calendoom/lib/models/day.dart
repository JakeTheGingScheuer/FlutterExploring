import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_driving/models/transaction.dart';

class Day extends ChangeNotifier {
  DateUtil date = DateUtil();

  int monthNumber;
  String monthName;
  int dayNumber;
  String weekday;
  int weekdayNumber;
  final int offset = 2;

  List<Transaction> transactions;
  double credits = 0.00;
  double debits = 0.00;
  double balance = 0.00;

  Day(int monthNum, int dayNum, int weekdayNumber) {
    this.weekdayNumber = weekdayNumber;
    this.monthNumber = monthNum;
    this.monthName = date.month(monthNum);
    this.dayNumber = dayNum;
    this.weekday = date.day(weekdayNumber + offset);
    this.transactions = List<Transaction>();
  }

  calculateBalance() {
    this.credits = 0.00;
    this.debits = 0.00;

    transactions.forEach((trans) => addToLedger(trans));

    balance = credits + debits;
  }

  addToLedger(Transaction transaction){
    if(transaction.isCredit){
      credits += transaction.value;
    } else {
      debits += transaction.value;
    }
  }

  addTransaction(Transaction transaction) {
    transactions.add(transaction);
  }

  deleteTransaction(Transaction transaction) {
    transactions.remove(transaction);
  }



  Map<String,dynamic> toJson() {
    Map<String, dynamic> dayJson = new Map();
    dayJson['monthName'] = monthName;
    dayJson['monthNumber'] = monthNumber;
    dayJson['dayNumber'] = dayNumber;
    dayJson['weekdayNumber'] = weekdayNumber;
    dayJson['weekday'] = weekday;

    Map<String, dynamic> transactionMap = new Map();

    for(int i = 0; i<transactions.length; i++){
      transactions[i].setTransKey(i);
      transactionMap[transactions[i].transKey] = transactions[i].toJson();
    }
    dayJson['transactions'] = transactionMap;

    return dayJson;
  }

  String dayKey(){
    return weekday+' '+monthName+' '+dayNumber.toString();
  }

  Day.fromJson(Map<String,dynamic> json){
    monthName = json['monthName'];
    monthNumber = json['monthNumber'];
    dayNumber = json['dayNumber'];
    weekdayNumber = json['weekdayNumber'];
    weekday = json['weekday'];
    transactions = List<Transaction>();

    Map<String, dynamic> transactionsJson = json['transactions'];

    for(int i = 0; i < transactionsJson.length; i++){
      String transactionKey = i.toString();
      transactions.add(Transaction.fromJson(transactionsJson[transactionKey]));
    }
  }
}