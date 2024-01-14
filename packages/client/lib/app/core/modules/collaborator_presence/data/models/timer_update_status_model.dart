import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class TimerUpdateStatusModel extends TimerUpdateStatusEntity {
  const TimerUpdateStatusModel({required super.isUpdated});

  static TimerUpdateStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const TimerUpdateStatusModel(isUpdated: false);
    } else {
      return const TimerUpdateStatusModel(isUpdated: true);
    }
  }
}
