import 'package:budget_calendar/widgets/transaction.dart';
import 'package:budget_calendar/widgets/date_formated.dart';
import 'package:flutter/material.dart';

class DayModel with ChangeNotifier {
  String month;
  String weekday;
  String dayNumber;
  List<Transaction> transactions = [];

  DayModel(int monthNumber, int weekdayNumber, int dayNumber){
   DateFormatted date = DateFormatted(monthNumber, weekdayNumber, dayNumber);
   this.month = date.month;
   this.weekday = date.weekday;
   this.dayNumber = date.dayNum.toString();

  }

  double getDailyBalance() {
    double balance = 0.0;
    for(int i =0; i<transactions.length; i++) {
      balance += transactions[i].amount;
    }
    return balance;
  }

  double getCredits() {
    double credits = 0.0;
    for(int i =0; i<transactions.length; i++) {
      if(transactions[i].amount>0){
      credits += transactions[i].amount;
      }
    }
    return credits;
  }

  double getDebits() {
    double debits = 0.0;
    for(int i =0; i<transactions.length; i++) {
      if(transactions[i].amount<0){
        debits += transactions[i].amount;
      }
    }
    return debits;
  }

  String dayTitle(){
    return weekday+' '+month+' '+dayNumber;
  }

  void addTrans(Transaction transaction) {
    transactions.add(transaction);
    notifyListeners();
  }

  void deleteTrans(Transaction transaction) {
    this.transactions.remove(transaction);
    notifyListeners();
  }
}