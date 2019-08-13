import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/models/date.dart';

void main() {
  group('unit tests for date', () {
    test('Date initialization', () {
      Date date = new Date(8,13,2019);
      expect(date.monthNumber, 8);
      expect(date.dayNumber, 13);
      expect(date.year, 2019);
    });
  });
}