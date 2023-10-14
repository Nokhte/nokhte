import 'package:flutter_test/flutter_test.dart';
import 'package:primala/app/core/widgets/beach_widgets/beach_waves/stack/utils/time_allocator.dart';
import 'package:primala/app/core/widgets/beach_widgets/_shared/types/types.dart';

void main() {
  test("generateDurations works as expected with a few inputs", () {
    final res1 = TimeAllocator.generateDurations(
        duration: const Duration(seconds: 10), numIncrements: 2);
    expect(res1, [
      const CustomDuration(
        begin: Duration(seconds: 0),
        end: Duration(seconds: 5),
      ),
      const CustomDuration(
        begin: Duration(seconds: 5),
        end: Duration(seconds: 10),
      ),
    ]);

    final res2 = TimeAllocator.generateDurations(
        duration: const Duration(seconds: 9), numIncrements: 2);
    expect(res2, [
      const CustomDuration(
        begin: Duration(seconds: 0),
        end: Duration(seconds: 4, milliseconds: 500),
      ),
      const CustomDuration(
        begin: Duration(seconds: 4, milliseconds: 500),
        end: Duration(seconds: 9),
      ),
    ]);
    final res3 = TimeAllocator.generateDurations(
        duration: const Duration(seconds: 13, milliseconds: 500),
        numIncrements: 3);

    expect(res3, [
      const CustomDuration(
        begin: Duration(seconds: 0),
        end: Duration(seconds: 4, milliseconds: 500),
      ),
      const CustomDuration(
        begin: Duration(seconds: 4, milliseconds: 500),
        end: Duration(seconds: 9),
      ),
      const CustomDuration(
        begin: Duration(seconds: 9),
        end: Duration(seconds: 13, milliseconds: 500),
      ),
    ]);
  });
}
