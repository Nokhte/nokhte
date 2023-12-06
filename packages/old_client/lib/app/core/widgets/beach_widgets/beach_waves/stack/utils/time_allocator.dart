
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';

class TimeAllocator {
  static List<CustomDuration> generateDurations(
      {required Duration duration, required int numIncrements}) {
    final List<CustomDuration> customDurations = [];

    for (int i = 0; i < numIncrements; i++) {
      final beginMillis = (i * duration.inMilliseconds ~/ numIncrements);
      final endMillis = ((i + 1) * duration.inMilliseconds ~/ numIncrements);

      final begin = Duration(milliseconds: beginMillis);
      final end = Duration(milliseconds: endMillis);

      customDurations.add(CustomDuration(begin: begin, end: end));
    }

    return customDurations;
  }
}
