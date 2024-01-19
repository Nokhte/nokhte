import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class PhaseUpdateStatusModel extends PhaseUpdateStatusEntity {
  const PhaseUpdateStatusModel({required super.isUpdated});

  static PhaseUpdateStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const PhaseUpdateStatusModel(isUpdated: false);
    } else {
      return const PhaseUpdateStatusModel(isUpdated: true);
    }
  }
}
