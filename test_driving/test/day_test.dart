import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/day.dart';

void main() {
  group('unit tests for day', () {
    test('Day should have a list ofd transactions', () {
      Day testDay = Day();

      expect(testDay.transactions, []);
    });

    test('Day should have a balance of 0.00 initally', () {
      Day testDay = Day();

      expect(testDay.getBalance(), 0.00);
    });

    test('Day should be able to add a new tranaction', () {
      Day testDay = Day();
      testDay.addTransaction();
      expect(testDay.transactions.length, 1);
    });

    test('Day should be able to delete a transaction', () {
      Day testDay = Day();
      testDay.addTransaction();
      testDay.deleteTransaction(testDay.transactions[0]);
      expect(testDay.transactions.length, 0);
    });

  });
}