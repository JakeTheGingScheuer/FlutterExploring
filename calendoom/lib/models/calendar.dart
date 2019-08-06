import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test_driving/models/transaction.dart';
import 'day.dart';
import 'month.dart';

class Calendar extends ChangeNotifier {
  List<Month> months;
  final int monthsDisplayed = 13;
  final int monthsInAYear = 12;
  DateTime creationDate;
  List<double> endOfMonthBalances;
  List<Transaction> reoccurringPayments;

  Calendar() {
    makeCalendarModel();
  }

  makeCalendarModel(){
    months = new List<Month>();
    creationDate = DateTime.now();
    checkIfJanuary();

    for(int i = 0; i < monthsDisplayed; i++){
      int currentMonth = creationDate.month+i;
      if(currentMonth > monthsInAYear){
        months.add(Month(creationDate.year+1, currentMonth-monthsInAYear));
      }else {
        months.add(Month(creationDate.year, currentMonth));
      }
    }
  }

  checkIfJanuary(){
    if(creationDate.month == 1) {
      months.add(Month(creationDate.year - 1, 12));
    }else{
      months.add(Month(creationDate.year, creationDate.month - 1));
    }
  }

  calculateBalance(){
    addReoccurringPayments();
    months.forEach((month) => month.days.forEach((day) => day.calculateBalance()));
    setEndOfMonthBalances();
    for(int i = 1; i < months.length; i++){
      months[i].setBeginningBalance(endOfMonthBalances[i-1]);
      setEndOfMonthBalances();
      months[i].days.forEach((day) => day.calculateBalance());
    }
  }

  setEndOfMonthBalances(){
    endOfMonthBalances = new List<double>();
    months.forEach((month) => month.setEndOfMonthBalance());
    months.forEach((month) => endOfMonthBalances.add(month.endOfMonthBalance));
  }


  addReoccurringPayments(){
    getAllReoccurringPayments();
    searchEachDayOfEachMonth();
  }

  getAllReoccurringPayments(){
    reoccurringPayments =  new List<Transaction>();
    months.forEach((month)=> month.days.forEach((day)=>
        day.transactions.forEach((trans)=> verifyReoccurringTrans(trans)
    )));
  }

  verifyReoccurringTrans(Transaction trans){
    if(trans.isReoccurring){
      reoccurringPayments.add(trans);
    }
  }

  searchEachDayOfEachMonth(){
    months.forEach((month)=> month.days.forEach((day)=> checkDay(day)));
  }

  checkDay(Day day){
    reoccurringPayments.forEach((trans)=> checkDayNumber(trans, day));
  }

  checkDayNumber(Transaction trans, Day day){
    if(trans.dayNumber == int.parse(day.dayNumber)){
      day.addTransaction(trans);
    }
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
    creationDate = DateTime.now();
    Map<String, dynamic> monthsJson = json['months'];
    List<String> monthKeys = monthsJson.keys.toList();
    int totalMonthsSaved = monthsJson.length;

    bool upToDate = false;
    for (int i = 0; i < totalMonthsSaved; i++) {
      Month monthOnFile = Month.fromJson(monthsJson[monthKeys[i]]);

      if(creationDate.month-1 == monthOnFile.monthNumber) {
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
    calculateBalance();
  }
}