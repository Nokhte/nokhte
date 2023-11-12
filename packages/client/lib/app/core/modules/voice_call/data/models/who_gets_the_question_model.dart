import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class WhoGetsTheQuestionModel extends WhoGetsTheQuestionEntity {
  const WhoGetsTheQuestionModel({required super.hasIt});

  static WhoGetsTheQuestionModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const WhoGetsTheQuestionModel(hasIt: false);
    } else {
      final String collaboratorOne = sbQueryRes.first.first["collaborator_one"];
      final int whoGetsTheQuestion =
          sbQueryRes.first.first["who_gets_the_question"];
      if (collaboratorOne == sbQueryRes[1]) {
        return WhoGetsTheQuestionModel(
          hasIt: whoGetsTheQuestion == 1 ? true : false,
        );
      } else {
        return WhoGetsTheQuestionModel(
          hasIt: whoGetsTheQuestion == 2 ? true : false,
        );
      }
    }
  }
}
