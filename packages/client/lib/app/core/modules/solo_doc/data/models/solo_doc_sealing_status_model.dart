import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

class SoloDocSealingStatusModel extends SoloDocSealingStatusEntity {
  const SoloDocSealingStatusModel({required super.isSealed});

  static SoloDocSealingStatusModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const SoloDocSealingStatusModel(isSealed: false);
    } else {
      return SoloDocSealingStatusModel(
          isSealed: sbQueryRes[0]["session_is_completed"]);
    }
  }
}
