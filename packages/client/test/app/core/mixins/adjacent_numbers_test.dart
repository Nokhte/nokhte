import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/mixins/mixin.dart';

void main() {
  group("getAdjacentNumbers", () {
    test("group of 4", () {
      final res1 = AdjacentNumbers.getAdjacentNumbers(4, 1);
      expect(res1, [4, 1, 2]);
      final res2 =
          AdjacentNumbers.getAdjacentNumbers(4, 1, includeIndex: false);
      expect(res2, [4, 2]);
      //
      final res3 = AdjacentNumbers.getAdjacentNumbers(4, 2);
      expect(res3, [1, 2, 3]);
      final res4 =
          AdjacentNumbers.getAdjacentNumbers(4, 2, includeIndex: false);
      expect(res4, [1, 3]);

      final res5 = AdjacentNumbers.getAdjacentNumbers(4, 3);
      expect(res5, [2, 3, 4]);
      final res6 =
          AdjacentNumbers.getAdjacentNumbers(4, 3, includeIndex: false);
      expect(res6, [2, 4]);
      //
      final res7 = AdjacentNumbers.getAdjacentNumbers(4, 4);
      expect(res7, [3, 4, 1]);
      final res8 =
          AdjacentNumbers.getAdjacentNumbers(4, 4, includeIndex: false);
      expect(res8, [3, 1]);
    });
  });
}
