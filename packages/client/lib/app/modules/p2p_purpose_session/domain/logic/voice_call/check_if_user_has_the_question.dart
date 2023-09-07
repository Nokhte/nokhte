import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class CheckIfUserHasTheQuestion
    extends AbstractFutureLogic<WhoGetsTheQuestionEntity, NoParams> {
  final P2PPurposeSessionVoiceCallContract contract;

  CheckIfUserHasTheQuestion({
    required this.contract,
  });

  @override
  call(params) async => await contract.checkIfUserHasTheQuestion();
}
