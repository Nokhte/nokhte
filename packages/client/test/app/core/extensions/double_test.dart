import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';

void main() {
  const five = 5.0, fivePointOne = 5.1, fiveHundred = 500.0;

  test("isLessThan", () {
    expect(five.isLessThan(fivePointOne), true);
    expect(fiveHundred.isLessThan(five), false);
  });

  test("isGreaterThan", () {
    expect(fiveHundred.isGreaterThan(five), true);
    expect(five.isGreaterThan(fiveHundred), false);
  });
  test("isGreaterThanOrEqualTo", () {
    expect(fiveHundred.isGreaterThanOrEqualTo(five), true);
    expect(five.isGreaterThanOrEqualTo(five), true);
    expect(five.isGreaterThanOrEqualTo(fiveHundred), false);
  });

  test("isLessThanOrEqualTo", () {
    expect(five.isLessThanOrEqualTo(fivePointOne), true);
    expect(five.isLessThanOrEqualTo(five), true);
    expect(fiveHundred.isLessThanOrEqualTo(five), false);
  });
}
