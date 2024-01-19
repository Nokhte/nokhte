import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';

class UpdateWantsToRepeatInvitationFlow
    implements AbstractFutureLogic<bool, bool> {
  final UserInformationContract contract;

  UpdateWantsToRepeatInvitationFlow({required this.contract});

  @override
  call(params) async =>
      await contract.updateWantsToRepeatInvitationFlow(params);
}
