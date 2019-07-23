import 'package:test_api/test_api.dart';
import 'package:test_driving/models/calendar.dart';

void main() {
  group('unit tests for calendar', () {
    test('Calendar should have a list of 14 months', () {
      Calendar testCalendar = Calendar();

      expect(testCalendar.months.length, 14);
    });
  });
}