import 'package:primala/app/core/modules/voice_call/domain/domain.dart';

class WhoGetsTheQuestionModel extends WhoGetsTheQuestionEntity {
  const WhoGetsTheQuestionModel({required super.hasIt});

  static WhoGetsTheQuestionModel fromSupabase(List sbQueryRes) {
    if (sbQueryRes.isEmpty) {
      return const WhoGetsTheQuestionModel(hasIt: false);
    } else {
      final String collaboratorOne = sbQueryRes[0][0]["collaborator_one"];
      // final String collaboratorTwo = sbQueryRes[0][0]["collaborator_two"];
      final int whoGetsTheQuestion = sbQueryRes[0][0]["who_gets_the_question"];
      if (collaboratorOne == sbQueryRes[1]) {
        // print("HI from here ${whoGetsTheQuestion == 1 ? true : false}");
        return WhoGetsTheQuestionModel(
          hasIt: whoGetsTheQuestion == 1 ? true : false,
        );
      } else {
        // print("HI from here ${whoGetsTheQuestion == 2 ? true : false}");
        return WhoGetsTheQuestionModel(
          hasIt: whoGetsTheQuestion == 2 ? true : false,
        );
      }
    }
  }
}
