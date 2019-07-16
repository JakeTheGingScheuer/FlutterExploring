import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/day.dart';
import 'package:test_driving/main.dart';
import 'package:test_driving/transaction.dart';

void main() {
  group('unit tests for day', () {
    test('Day should have a list ofd transactions', () {
      Day testDay = Day();

      expect(testDay.transactions, []);
    });

    test('Day should have a balance of 0.00 initally', () {
      Day testDay = Day();

      expect(testDay.balance, 0.00);
    });

    test('Day should be able to add a new tranaction', () {
      Day testDay = Day();
      testDay.addTransaction(Transaction());
      expect(testDay.transactions.length, 1);
    });

    test('Day should be able to delete a transaction', () {
      Day testDay = Day();
      testDay.addTransaction(Transaction());
      testDay.deleteTransaction(testDay.transactions[0]);
      expect(testDay.transactions.length, 0);
    });

    test('Day should have a balance that reflects the amount of all transactions', () {
      Day testDay = Day();
      testDay.addTransaction(Transaction());
      testDay.addTransaction(Transaction());
      testDay.transactions[0].setAmount(5.00);
      testDay.transactions[1].setAmount(3.00);
      testDay.calculateBalance();
      expect(testDay.balance, -8.00);
    });

    test('Day should return total of all credits when get credits is called', () {
      Day testDay = Day();
      testDay.addTransaction(Transaction());
      testDay.addTransaction(Transaction());
      testDay.transactions[0].setAmount(5.00);
      testDay.transactions[0].setIsCredit(true);
      testDay.transactions[1].setAmount(3.00);
      testDay.calculateBalance();
      expect(testDay.credits, 5.00);
    });

    test('Day should return total of all debits when get debits is called', () {
      Day testDay = Day();
      testDay.addTransaction(Transaction());
      testDay.addTransaction(Transaction());
      testDay.transactions[0].setAmount(5.00);
      testDay.transactions[0].setIsCredit(true);
      testDay.transactions[1].setAmount(3.00);
      testDay.calculateBalance();
      expect(testDay.debits, -3.00);
    });
  });
  group('widget tests for day',() {
    testWidgets('Day has a button for adding a new transaction', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      Finder addTransactionButtonFinder = find.byKey(Key('newTransaction'));
      expect(addTransactionButtonFinder, findsOneWidget);
    });
    testWidgets('Day has a list view of transactions', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      Finder transactionListFinder = find.byKey(Key('transactionList'));
      expect(transactionListFinder, findsOneWidget);
    });
  });
}