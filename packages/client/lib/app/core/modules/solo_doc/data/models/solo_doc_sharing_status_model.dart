import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';

class SoloDocSharingStatusModel extends SoloDocSharingStatusEntity {
  const SoloDocSharingStatusModel({required super.isShared});

  static SoloDocSharingStatusModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const SoloDocSharingStatusModel(isShared: false);
    } else {
      return SoloDocSharingStatusModel(
          isShared: sbQueryRes[0]["is_visible_to_collaborator"]);
    }
  }
}
