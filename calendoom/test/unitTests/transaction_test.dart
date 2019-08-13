import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/models/transaction.dart';
final int fakeDayNumber = 1;
final int fakeMonthNumber = 1;
final int fakeYear = 2000;
void main() {
  group('unit tests for transaction', () {
    test('Transaction initialization', () {
      Transaction testTransaction = Transaction(fakeDayNumber, fakeMonthNumber, fakeYear);

      expect(testTransaction.isReoccurring, false);
      expect(testTransaction.isCredit, false);
      expect(testTransaction.description, 'No Description');
      expect(testTransaction.value, 0.00);
    });

    test('Transaction value is a debit and negative by default', () {
      Transaction testTransaction = Transaction(fakeDayNumber, fakeMonthNumber, fakeYear);
      testTransaction.setAmount(5.00);
      expect(testTransaction.value, -5.00);
    });

    test('Transaction is positive if isCredit', () {
      Transaction testTransaction = Transaction(fakeDayNumber, fakeMonthNumber, fakeYear);
      testTransaction.setAmount(5.00);
      testTransaction.setIsCredit(true);
      expect(testTransaction.value, 5.00);
    });

    test('persists data appropriatley', () {
      Transaction testTransaction = Transaction(fakeDayNumber, fakeMonthNumber, fakeYear);
      testTransaction.setDescription('fake');
      testTransaction.setAmount(20.00);
      testTransaction.setIsCredit(true);
      testTransaction.setIsReoccurring(true);

      Map<String, dynamic> actualMap = testTransaction.toJson();
      Transaction after = Transaction.fromJson(actualMap);
      expect(after.description, 'fake');
      expect(after.value, 20.00);
      expect(after.isReoccurring, true);
      expect(after.isCredit, true);
    });
  });
}
