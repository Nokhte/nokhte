import 'package:primala/app/core/modules/solo_doc/domain/domain.dart';

class SoloDocSubmissionStatusModel extends SoloDocSubmissionStatusEntity {
  const SoloDocSubmissionStatusModel({required super.isSubmitted});

  static SoloDocSubmissionStatusModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const SoloDocSubmissionStatusModel(isSubmitted: false);
    } else {
      return SoloDocSubmissionStatusModel(
          isSubmitted: sbQueryRes[0]["content"].isNotEmpty);
    }
  }
}
