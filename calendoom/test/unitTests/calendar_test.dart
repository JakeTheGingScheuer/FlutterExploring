import 'package:test_api/test_api.dart';
import 'package:test_driving/models/calendar.dart';
import 'package:test_driving/models/day.dart';
import 'package:test_driving/models/month.dart';
import 'package:test_driving/models/transaction.dart';

void main() {
  group('unit tests for calendar', () {
    test('Calendar should have a list of 14 months', () {
      Calendar testCalendar = Calendar();

      expect(testCalendar.months.length, 14);
    });

    test('to Json makes a map of months', (){
      Calendar testCalendar = Calendar();
      Map<String, dynamic> calendarJson = testCalendar.toJson();

      expect(calendarJson['months'].length, 14);
    });

    test('from Json makes creates a calendar', (){
      Calendar fakeCalendar = Calendar();
      Map<String, dynamic> calendarJson = fakeCalendar.toJson();

      Calendar calendarFromJson = Calendar.fromJson(calendarJson);

      expect(calendarFromJson.months.length, 14);
    });

    test('data persists through layers', () {
      Calendar fakeCalendar = Calendar();
      Month fakeMonth = fakeCalendar.months[1];
      Day fakeDay = fakeMonth.days[1];
      Transaction fakeTrans = Transaction();

      fakeTrans.setDescription('fake');
      fakeTrans.setAmount(20.00);
      fakeTrans.setIsCredit(true);
      fakeTrans.setIsReoccurring(true);

      fakeDay.addTransaction(fakeTrans);

      Map<String, dynamic> calendarJson = fakeCalendar.toJson();
      Calendar calendarFromJson = Calendar.fromJson(calendarJson);

      Month monthPersisted = calendarFromJson.months[1];
      Day dayPersisted = monthPersisted.days[1];

      expect(dayPersisted.balance, 20.00);
    });
  });
}