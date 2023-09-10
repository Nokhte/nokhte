import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';

class CheckIfUserHasTheQuestion
    extends AbstractFutureLogic<WhoGetsTheQuestionEntity, NoParams> {
  final VoiceCallContract contract;

  CheckIfUserHasTheQuestion({
    required this.contract,
  });

  @override
  call(params) async => await contract.checkIfUserHasTheQuestion();
}
