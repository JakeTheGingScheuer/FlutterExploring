import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/main.dart';

void main() {
  group('widget tests for month screen', ()
  {
    testWidgets('Month should have a gridView', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      Finder monthGridFinder = find.byKey(Key('monthView'));

      expect(monthGridFinder, findsOneWidget);
    });
    testWidgets('Month should display month name', (WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      Finder monthTitleFinder = find.byKey(Key('monthTitle'));
      Finder monthNameFinder = find.text('June 2019');
      expect(monthNameFinder, findsOneWidget);
      expect(monthTitleFinder, findsOneWidget);
  });
    testWidgets('Month should have a grid tile for each day of the month', (WidgetTester tester) async {
        await tester.pumpWidget(MyApp());

        Finder dayTilesFinder = find.byKey(Key('monthView'));

        expect(dayTilesFinder, findsOneWidget);
    });

  });
}
