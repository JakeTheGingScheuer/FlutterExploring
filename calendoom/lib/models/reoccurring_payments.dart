import 'package:test_driving/models/transaction.dart';
import 'day.dart';
import 'month.dart';

class ReoccurringPayments {
  List<Month> monthList;
  List<Transaction> reoccurringPayments;

  ReoccurringPayments(this.monthList){
    reoccurringPayments = new List<Transaction>();
  }

  update(){
    findAllReoccurringPayments();
    populateReoccurringPaymentsInCalendar();
    return monthList;
  }

  findAllReoccurringPayments(){
    monthList.forEach((month)=>
        month.days.forEach((day)=>
            day.transactions.forEach((trans)=>
                checkIfReoccurring(trans))));
  }

  checkIfReoccurring(Transaction trans){
    if(trans.isReoccurring){
      addToReoccurringPaymentList(trans);
    }
  }

  addToReoccurringPaymentList(Transaction trans){
    trans.setIsReoccurring(false);
    reoccurringPayments.add(trans);
  }

  populateReoccurringPaymentsInCalendar(){
    monthList.forEach((month)=>
        month.days.forEach((day)=>
            checkReoccurringPaymentDates(day)));
  }

  checkReoccurringPaymentDates(Day calendar){
    reoccurringPayments.forEach((payment)=>
        addPaymentToFutureDates(payment, calendar));
  }

  addPaymentToFutureDates(Transaction payment, Day dayOfMonth){
    bool yearIsInFuture = dayOfMonth.year > payment.year;
    bool monthIsInFuture = dayOfMonth.monthNumber > payment.monthNumber;

    if(yearIsInFuture || monthIsInFuture){
      addPaymentIfSameDayOfTheMonth(payment, dayOfMonth);
    }
  }

  addPaymentIfSameDayOfTheMonth(Transaction payment, Day dayOfMonth){
    if(dayOfMonth.dayNumber == payment.dayNumber){
      dayOfMonth.addTransaction(payment);
    }
  }
}