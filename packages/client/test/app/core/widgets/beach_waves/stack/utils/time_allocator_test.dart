import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/beach_waves/stack/utils/time_allocator.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';

void main() {
  test("generateDurations works as expected with a few inputs", () {
    final res1 = TimeAllocator.generateDurations(
        duration: Seconds.get(10), numIncrements: 2);
    expect(res1, [
      CustomDuration(
        begin: Seconds.get(0),
        end: Seconds.get(5),
      ),
      CustomDuration(
        begin: Seconds.get(5),
        end: Seconds.get(10),
      ),
    ]);

    final res2 = TimeAllocator.generateDurations(
        duration: Seconds.get(9), numIncrements: 2);
    expect(res2, [
      CustomDuration(
        begin: Seconds.get(0),
        end: Seconds.get(4, milli: 500),
      ),
      CustomDuration(
        begin: Seconds.get(4, milli: 500),
        end: Seconds.get(9),
      ),
    ]);
    final res3 = TimeAllocator.generateDurations(
        duration: Seconds.get(13, milli: 500), numIncrements: 3);

    expect(res3, [
      CustomDuration(
        begin: Seconds.get(0),
        end: Seconds.get(4, milli: 500),
      ),
      CustomDuration(
        begin: Seconds.get(4, milli: 500),
        end: Seconds.get(9),
      ),
      CustomDuration(
        begin: Seconds.get(9),
        end: Seconds.get(13, milli: 500),
      ),
    ]);
  });

  test("generateWithTransitionPeriods", () {
    final res1 = TimeAllocator.generateWithTransitionPeriods(
      duration: Seconds.get(10),
      numIncrements: 2,
      transitionPeriod: Seconds.get(1),
    );
    expect(res1, [
      CustomDuration(
        begin: Seconds.get(0),
        end: Seconds.get(4),
      ),
      CustomDuration(
        begin: Seconds.get(4),
        end: Seconds.get(5),
      ),
      CustomDuration(
        begin: Seconds.get(5),
        end: Seconds.get(10),
      ),
    ]);
    final res2 = TimeAllocator.generateWithTransitionPeriods(
        duration: Seconds.get(9),
        numIncrements: 2,
        transitionPeriod: Seconds.get(1, milli: 500));
    expect(
      res2,
      [
        CustomDuration(begin: Seconds.get(0), end: Seconds.get(3)),
        CustomDuration(begin: Seconds.get(3), end: Seconds.get(4, milli: 500)),
        CustomDuration(begin: Seconds.get(4, milli: 500), end: Seconds.get(9)),
      ],
    );
    final res3 = TimeAllocator.generateWithTransitionPeriods(
      duration: Seconds.get(13, milli: 500),
      numIncrements: 3,
      transitionPeriod: Seconds.get(2),
    );
    expect(res3, [
      CustomDuration(
        begin: Seconds.get(0),
        end: Seconds.get(2, milli: 500),
      ),
      CustomDuration(
        begin: Seconds.get(2, milli: 500),
        end: Seconds.get(4, milli: 500),
      ),
      CustomDuration(
        begin: Seconds.get(4, milli: 500),
        end: Seconds.get(7),
      ),
      CustomDuration(
        begin: Seconds.get(7),
        end: Seconds.get(9),
      ),
      CustomDuration(
        begin: Seconds.get(9),
        end: Seconds.get(13, milli: 500),
      ),
    ]);
  });
}
