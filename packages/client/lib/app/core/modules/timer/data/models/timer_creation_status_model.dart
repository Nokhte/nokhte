import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

class TimerCreationStatusModel extends TimerCreationStatusEntity {
  const TimerCreationStatusModel({required super.isCreated});

  static TimerCreationStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const TimerCreationStatusModel(isCreated: false);
    } else {
      return const TimerCreationStatusModel(isCreated: true);
    }
  }
}
