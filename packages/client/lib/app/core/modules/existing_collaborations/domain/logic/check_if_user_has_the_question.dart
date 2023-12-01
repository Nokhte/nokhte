import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/domain/domain.dart';

class CheckIfUserHasTheQuestion
    implements AbstractFutureLogic<WhoHasTheQuestionEntity, NoParams> {
  final ExistingCollaborationsContract contract;

  CheckIfUserHasTheQuestion({required this.contract});

  @override
  call(params) async => await contract.checkIfUserHasTheQuestion(params);
}
