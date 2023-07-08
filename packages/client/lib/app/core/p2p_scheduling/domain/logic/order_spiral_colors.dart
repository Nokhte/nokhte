import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/p2p_scheduling/domain/entities/p2p_scheduling_ordered_times_entity.dart';

// So this needs to be modified
class OrderSpiralColors extends AbstractSyncNoFailureLogic<
    P2PSchedulingOrderedTimesEntity, NoParams> {
  DateTime presentMoment;

  OrderSpiralColors({required this.presentMoment});

  List<String> generateTimeArray(DateTime startTime) {
    List<String> timeArray = [];

    late int minute;
    late int hour = startTime.hour;

    minute = startTime.minute >= 0 && startTime.minute < 29
        ? startTime.minute < 15
            ? 0
            : 15
        : startTime.minute < 45
            ? 30
            : 45;

    startTime =
        DateTime(startTime.year, startTime.month, startTime.day, hour, minute);

    // Set the starting time to the nearest 30-minute increment
    startTime = DateTime(startTime.year, startTime.month, startTime.day,
        startTime.hour, startTime.minute);

    for (int i = 0; i < 49; i++) {
      // Format the time value as HH:mm
      String time =
          '${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}';
      // Add the time value to the array

      timeArray.add(time);

      // Increment the time by 30 minutes
      startTime = startTime.add(const Duration(minutes: 15));

      // Increment the time by 30 minutes
    }

    return timeArray;
  }

  @override
  P2PSchedulingOrderedTimesEntity call(NoParams params) {
    final orderedTimes = generateTimeArray(presentMoment);
    return P2PSchedulingOrderedTimesEntity(orderedTimesArr: orderedTimes);
  }
}
