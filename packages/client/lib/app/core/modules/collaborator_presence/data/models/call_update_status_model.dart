import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class CallUpdateStatusModel extends CallUpdateStatusEntity {
  const CallUpdateStatusModel({required super.isUpdated});

  static CallUpdateStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const CallUpdateStatusModel(isUpdated: false);
    } else {
      return const CallUpdateStatusModel(isUpdated: true);
    }
  }
}
