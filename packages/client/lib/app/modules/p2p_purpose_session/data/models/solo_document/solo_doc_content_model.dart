import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class SoloDocContentModel extends SoloDocContentEntity {
  const SoloDocContentModel({required super.content});

  static SoloDocContentModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const SoloDocContentModel(content: "");
    } else {
      return SoloDocContentModel(content: sbQueryRes[0]["content"]);
    }
  }
}
