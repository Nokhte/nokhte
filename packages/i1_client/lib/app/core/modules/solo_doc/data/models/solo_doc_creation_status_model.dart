import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';

class SoloDocCreationStatusModel extends SoloDocCreationStatusEntity {
  const SoloDocCreationStatusModel({required super.isCreated});

  static SoloDocCreationStatusModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const SoloDocCreationStatusModel(isCreated: false);
    } else {
      return const SoloDocCreationStatusModel(isCreated: true);
    }
  }
}
