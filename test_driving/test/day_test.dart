import 'package:flutter_test/flutter_test.dart';
import 'package:test_driving/day.dart';

void main() {
  group('unit tests for day', () {
    test('Day should have a list ofd transactions', () {
      Day testDay = Day();

      expect(testDay.transactions, []);
    });
  });
}