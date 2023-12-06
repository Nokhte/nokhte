import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

class TimerRunningUpdateStatusModel extends TimerRunningUpdateStatusEntity {
  const TimerRunningUpdateStatusModel({required super.isUpdated});

  static TimerRunningUpdateStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const TimerRunningUpdateStatusModel(isUpdated: false);
    } else {
      return const TimerRunningUpdateStatusModel(isUpdated: true);
    }
  }
}
