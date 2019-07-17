import 'package:flutter/cupertino.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/main.dart';
import 'package:date_util/date_util.dart';

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
      DateUtil dateUtil = DateUtil();
      String month = dateUtil.month(DateTime.now().month);

      Finder monthTitleFinder = find.byKey(Key('monthTitle'));
      Finder monthNameFinder = find.text(month);
      expect(monthNameFinder, findsOneWidget);
      expect(monthTitleFinder, findsOneWidget);
  });
    testWidgets('Month should have a grid tile for each day of the month', (WidgetTester tester) async {
        await tester.pumpWidget(MyApp());

        Finder dayTilesFinder = find.byKey(Key('monthView'));

        expect(dayTilesFinder, findsOneWidget);
    });

  });}