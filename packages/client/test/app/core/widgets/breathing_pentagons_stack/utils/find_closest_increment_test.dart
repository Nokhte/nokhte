// * Testing & Mocking Libs
import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/widgets/breathing_pentagons_stack/utils/find_closest_increment.dart';

void main() {
  test("Finds the closest increment accurately with a set of expected values",
      () {
    const input1 = 0.5;
    final expected1 = FindClosestIncrement.call(input1);
    expect(expected1, 0);

    const input2 = 1.26;
    final expected2 = FindClosestIncrement.call(input2);
    expect(expected2, 1.25);
    const input3 = .75;
    final expected3 = FindClosestIncrement.call(input3);
    expect(expected3, 1.25);
    const input4 = 7.8;
    final expected4 = FindClosestIncrement.call(input4);
    expect(expected4, 7.5);
  });
}
