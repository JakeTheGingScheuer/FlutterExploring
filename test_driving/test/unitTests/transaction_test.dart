import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/models/transaction.dart';

void main() {
  group('unit tests for transaction', () {
    test('Transaction should have 0.00 as starting value', () {
      Transaction testTransaction = Transaction();

      expect(testTransaction.value, 0.00);
    });

    test('Transaction should have a default description initally', () {
      Transaction testTransaction = Transaction();

      expect(testTransaction.description, 'description here');
    });

    test('Transaction by default is debit', () {
      Transaction testTransaction = Transaction();

      expect(testTransaction.isCredit, false);
    });

    test('Transaction by default is not reoccuring', () {
      Transaction testTransaction = Transaction();

      expect(testTransaction.isReoccuring, false);
    });

    test('Transaction is negative by default', () {
      Transaction testTransaction = Transaction();
      testTransaction.setAmount(5.00);
      expect(testTransaction.value, -5.00);
    });

    test('Transaction is positive if isCredit', () {
      Transaction testTransaction = Transaction();
      testTransaction.setAmount(5.00);
      testTransaction.setIsCredit(true);
      expect(testTransaction.value, 5.00);
    });
  });
}
