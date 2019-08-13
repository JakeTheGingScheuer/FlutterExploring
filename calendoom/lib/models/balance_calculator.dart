import 'package:test_driving/models/month.dart';
import 'package:test_driving/models/reoccurring_payments.dart';

class BalanceCalculator{
  List<Month> monthList;
  ReoccurringPayments reoccurringPayments;
  List<double> endOfMonthBalances;

  BalanceCalculator(this.monthList){
    reoccurringPayments = ReoccurringPayments(monthList);
    calculateBalance();
  }

  calculateBalance(){
    monthList = reoccurringPayments.update();
    calculateAllDailyBalances(monthList);
    setEndOfMonthBalances();
    for(int i = 1; i < monthList.length; i++){
      carryBalanceBetweenMonths(i);
      setEndOfMonthBalances();
      calculateDailyBalancesForTheEntireMonth(i);
    }
  }

  calculateAllDailyBalances(List<Month> monthList){
    monthList.forEach((month) =>
        month.days.forEach((day) =>
            day.calculateBalance()));
  }

  setEndOfMonthBalances(){
    endOfMonthBalances = new List<double>();
    monthList.forEach((month) => month.setEndOfMonthBalance());
    monthList.forEach((month) => endOfMonthBalances.add(month.endOfMonthBalance));
  }
  carryBalanceBetweenMonths(int i){
    monthList[i].setBeginningBalance(endOfMonthBalances[i-1]);
  }
  calculateDailyBalancesForTheEntireMonth(int i){
    monthList[i].days.forEach((day) => day.calculateBalance());
  }
}