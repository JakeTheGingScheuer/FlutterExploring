import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/main.dart';

void main(){
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