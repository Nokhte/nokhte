import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/domain/domain.dart';

class CheckIfCollaboratorIsTalking
    implements
        AbstractFutureLogic<CheckIfCollaboratorIsTalkingEntity, NoParams> {
  final OneTalkerAtATimeContract contract;

  CheckIfCollaboratorIsTalking({required this.contract});

  @override
  call(params) async => await contract.checkIfCollaboratorIsTalking(params);
}
