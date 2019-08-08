import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/models/transaction.dart';

void main() {
  group('unit tests for day', () {
    test('Day should have a list of transactions', () {
      Day testDay = Day(1,1,1, 2000);

      expect(testDay.transactions, []);
    });

    test('Day should have a balance of 0.00 initally', () {
      Day testDay = Day(1,1,1, 2000);

      expect(testDay.balance, 0.00);
    });

    test('Day should be able to add a new tranaction', () {
      Day testDay = Day(1,1,1, 2000);
      testDay.addTransaction(Transaction(testDay.dayNumber, testDay.monthNumber, testDay.year));
      expect(testDay.transactions.length, 1);
    });

    test('Day should be able to delete a transaction', () {
      Day testDay = Day(1,1,1, 2000);
      testDay.addTransaction(Transaction(testDay.dayNumber, testDay.monthNumber, testDay.year));
      testDay.deleteTransaction(testDay.transactions[0]);
      expect(testDay.transactions.length, 0);
    });

    test('Day should have a balance that reflects the amount of all transactions', () {
      Day testDay = Day(1,1,1, 2000);
      testDay.addTransaction(Transaction(testDay.dayNumber, testDay.monthNumber, testDay.year));
      testDay.addTransaction(Transaction(testDay.dayNumber, testDay.monthNumber, testDay.year));
      testDay.transactions[0].setAmount(5.00);
      testDay.transactions[1].setAmount(3.00);
      testDay.calculateBalance();
      expect(testDay.balance, -8.00);
    });

    test('Day should return total of all credits when get credits is called', () {
      Day testDay = Day(1,1,1, 2000);
      testDay.addTransaction(Transaction(testDay.dayNumber, testDay.monthNumber, testDay.year));
      testDay.addTransaction(Transaction(testDay.dayNumber, testDay.monthNumber, testDay.year));
      testDay.transactions[0].setAmount(5.00);
      testDay.transactions[0].setIsCredit(true);
      testDay.transactions[1].setAmount(3.00);
      testDay.calculateBalance();
      expect(testDay.credits, 5.00);
    });

    test('Day should return total of all debits when get debits is called', () {
      Day testDay = Day(1,1,1, 2000);
      testDay.addTransaction(Transaction(testDay.dayNumber, testDay.monthNumber, testDay.year));
      testDay.addTransaction(Transaction(testDay.dayNumber, testDay.monthNumber, testDay.year));
      testDay.transactions[0].setAmount(5.00);
      testDay.transactions[0].setIsCredit(true);
      testDay.transactions[1].setAmount(3.00);
      testDay.calculateBalance();
      expect(testDay.debits, -3.00);
    });

    test('toJson', () {
      Day testDay = Day(1,1,1, 2000);

      Transaction fakeTrans = Transaction(testDay.dayNumber, testDay.monthNumber, testDay.year);
      fakeTrans.setDescription('fake');
      fakeTrans.setAmount(20.00);
      fakeTrans.setIsCredit(true);
      fakeTrans.setIsReoccurring(true);

      testDay.addTransaction(fakeTrans);

      Map<String,dynamic> testDayJson = testDay.toJson();
      expect(testDayJson['monthName'], 'January');
      expect(testDayJson['dayNumber'], 1);
      expect(testDayJson['weekdayNumber'], 1);
      expect(testDayJson['weekday'], 'Monday');
      expect(testDayJson['transactions'].length, 1);
      expect(testDayJson['transactions']['0']['description'], 'fake');
      expect(testDayJson['transactions']['0']['value'], 20.00);
      expect(testDayJson['transactions']['0']['isCredit'], true);
      expect(testDayJson['transactions']['0']['isReoccurring'], true);
    });

    test('fromJson', () {
      Day testDay = Day(1,1,1, 2000);
      Transaction fakeTrans = Transaction(testDay.dayNumber, testDay.monthNumber, testDay.year);
      fakeTrans.setDescription('fake');
      fakeTrans.setAmount(20.00);
      fakeTrans.setIsCredit(true);
      fakeTrans.setIsReoccurring(true);

      testDay.addTransaction(fakeTrans);

      Map<String,dynamic> fakeDayJson = testDay.toJson();

      Day actual = Day.fromJson(fakeDayJson);
      expect(actual.monthName, 'January');
      expect(actual.transactions.length, 1);
      expect(actual.transactions[0].value, 20.0);
      expect(actual.transactions[0].isCredit, true);
      expect(actual.transactions[0].isReoccurring, true);
    });
  });
}