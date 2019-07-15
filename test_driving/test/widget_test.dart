import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:test_driving/main.dart';
import 'package:test_driving/transaction.dart';

void main() {
  test('Transaction should have 0.00 as starting value', () {
    Transaction testTransaction = Transaction();

    expect(testTransaction.value, 0.00);
  });

  testWidgets('Transaction widget displays value', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    Finder valueFinder = find.text('0.00');

    expect(valueFinder, findsOneWidget);
  });
}
