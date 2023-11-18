import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

class PresenceUpdateStatusModel extends PresenceUpdateStatusEntity {
  const PresenceUpdateStatusModel({required super.isUpdated});

  static PresenceUpdateStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const PresenceUpdateStatusModel(isUpdated: false);
    } else {
      return const PresenceUpdateStatusModel(isUpdated: true);
    }
  }
}
