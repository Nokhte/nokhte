import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';

class TimeAllocator {
  static List<CustomDuration> generateDurations(
      {required Duration duration, required int numIncrements}) {
    final List<CustomDuration> customDurations = [];

    for (int i = 0; i < numIncrements; i++) {
      final timePeriod = _generateWithoutTransition(i, duration, numIncrements);
      customDurations.add(timePeriod);
    }

    return customDurations;
  }

  static _generateWithoutTransition(
    int i,
    Duration duration,
    int numIncrements,
  ) {
    final beginMillis = (i * duration.inMilliseconds ~/ numIncrements);
    final endMillis = ((i + 1) * duration.inMilliseconds ~/ numIncrements);

    final begin = Duration(milliseconds: beginMillis);
    final end = Duration(milliseconds: endMillis);

    return CustomDuration(begin: begin, end: end);
  }

  static List<CustomDuration> generateWithTransitionPeriods({
    required Duration duration,
    required int numIncrements,
    required Duration transitionPeriod,
  }) {
    final List<CustomDuration> customDurations = [];
    for (int i = 0; i < numIncrements; i++) {
      final beginMillis = (i * duration.inMilliseconds ~/ numIncrements);
      int endMillis;
      if ((i + 1) < numIncrements) {
        endMillis = ((i + 1) * duration.inMilliseconds ~/ numIncrements) -
            transitionPeriod.inMilliseconds;

        final mainBeginPeriod = Duration(milliseconds: beginMillis);
        final mainEndPeriod = Duration(milliseconds: endMillis);
        customDurations
            .add(CustomDuration(begin: mainBeginPeriod, end: mainEndPeriod));
        final transitionEndPeriod = Duration(
            milliseconds:
                mainEndPeriod.inMilliseconds + transitionPeriod.inMilliseconds);
        customDurations.add(
            CustomDuration(begin: mainEndPeriod, end: transitionEndPeriod));
      } else {
        final transitionPeriod =
            _generateWithoutTransition(i, duration, numIncrements);
        customDurations.add(transitionPeriod);
      }
    }

    return customDurations;
  }
}
