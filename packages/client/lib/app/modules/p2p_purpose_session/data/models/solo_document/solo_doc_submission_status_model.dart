import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

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
