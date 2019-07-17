import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/models/month.dart';

void main() {
  group('unit tests for month', () {

    test('the month of july should have 31 days', () {
      Month testMonth = Month();
      expect(testMonth.days.length, 31);
    });
  });
}