import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/main.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/screens/day_screen.dart';

void main(){
  group('widget tests for day',() {
    testWidgets('Day has a button for adding a new transaction', (WidgetTester tester) async {
      await tester.pumpWidget(MockMaterialApp());
      Finder addTransactionButtonFinder = find.byKey(Key('newTransaction'));
      expect(addTransactionButtonFinder, findsOneWidget);
    });
    testWidgets('Day has a list view of transactions', (WidgetTester tester) async {
      await tester.pumpWidget(MockMaterialApp());
      Finder transactionListFinder = find.byKey(Key('transactionList'));
      expect(transactionListFinder, findsOneWidget);
    });
  });
}

class MockMaterialApp extends StatelessWidget {
  Day testDay = Day();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: DayScreen(testDay)
    );
  }
}