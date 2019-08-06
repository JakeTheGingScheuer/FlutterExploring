import 'package:date_util/date_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:test_driving/models/transaction.dart';

class Day extends ChangeNotifier {
  DateUtil date = DateUtil();

  String month;
  String dayNumber;
  String weekday;
  int weekdayNumber;
  final int offset = 2;

  List<Transaction> transactions;
  double credits = 0.00;
  double debits = 0.00;
  double balance = 0.00;

  Day(int monthNum, int dayNum, int weekdayNumber) {
    this.weekdayNumber = weekdayNumber;
    this.month = date.month(monthNum);
    this.dayNumber = dayNum.toString();
    this.weekday = date.day(weekdayNumber + offset);
    this.transactions = List<Transaction>();
  }

  calculateBalance() {
    this.credits = 0.00;
    this.debits = 0.00;

    transactions.forEach((trans) => addToLedger(trans));

    balance = credits + debits;
    notifyListeners();
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
    notifyListeners();
  }

  deleteTransaction(Transaction transaction) {
    transactions.remove(transaction);
    notifyListeners();
  }


  Map<String,dynamic> toJson() {
    Map<String, dynamic> dayJson = new Map();
    dayJson['month'] = month;
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
    return weekday+' '+month+' '+dayNumber;
  }

  Day.fromJson(Map<String,dynamic> json){
    month = json['month'];
    dayNumber = json['dayNumber'];
    weekdayNumber = json['weekdayNumber'];
    weekday = json['weekday'];
    transactions = List<Transaction>();

    Map<String, dynamic> transactionsJson = json['transactions'];

    for(int i = 0; i < transactionsJson.length; i++){
      String transactionKey = i.toString();
      transactions.add(Transaction.fromJson(transactionsJson[transactionKey]));
    }
    calculateBalance();
  }
}