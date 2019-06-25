import 'package:flutter_test/flutter_test.dart';
import 'package:my_app/counter.dart';

void main() {


  test('Counter should have a value', () {
    Counter counter = Counter();
    expect(counter.value, 0);
  });

  test('When addToValue is called value is incremented', () {
    Counter counter = Counter();
    counter.addToValue();
    expect(counter.value, 1);
  });

  test('When subtractFromValue is called value is decremented', () {

  });
}