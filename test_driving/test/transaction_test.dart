import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/main.dart';
import 'package:test_driving/transaction.dart';

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


  group('widget tests for transaction', () {

    testWidgets('Transaction description input works', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.enterText(find.byKey(Key('descriptionInput')), 'BILL');

      Finder descriptionInputFinder = find.text('BILL');

      expect(descriptionInputFinder, findsOneWidget);
    });

    testWidgets('Transaction should have an description input field', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      Finder descriptionInputFinder = find.byKey(Key('descriptionInput'));

      expect(descriptionInputFinder, findsOneWidget);
    });

    testWidgets('Transaction should have an amount input field', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      Finder amountInputFinder = find.byKey(Key('amountInput'));

      expect(amountInputFinder, findsOneWidget);
    });

    testWidgets('Transaction amount input works', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());
      await tester.enterText(find.byKey(Key('amountInput')), '23.00');

      Finder amountInputFinder = find.text('23.00');

      expect(amountInputFinder, findsOneWidget);
    });

    testWidgets('Transaction has a credit/debit switch', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      Finder creditDebitFinder = find.byKey(Key('creditDebit'));

      expect(creditDebitFinder, findsOneWidget);

    });

    testWidgets('Transaction has a reoccuring switch', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      Finder reoccuringFinder = find.byKey(Key('reoccuring'));

      expect(reoccuringFinder, findsOneWidget);

    });
  });
}
