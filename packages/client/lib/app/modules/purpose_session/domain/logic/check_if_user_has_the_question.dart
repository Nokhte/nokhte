import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/purpose_session/domain/domain.dart';

class CheckIfUserHasTheQuestion
    implements AbstractFutureLogic<WhoHasTheQuestionEntity, NoParams> {
  final PurposeSessionContract contract;

  CheckIfUserHasTheQuestion({required this.contract});

  @override
  call(params) async => await contract.checkIfUserHasTheQuestion(params);
}
