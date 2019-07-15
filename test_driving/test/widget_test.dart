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
  });


  group('widget tests for transaction', () {

    testWidgets('Transaction widget displays value', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      Finder valueFinder = find.text('0.00');

      expect(valueFinder, findsOneWidget);
    });


    testWidgets('Transaction widget dispalys description', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      Finder descriptionFinder = find.text('description here');

      expect(descriptionFinder, findsOneWidget);
    });

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
  });
}
