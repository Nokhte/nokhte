import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';

class UpdateHasGoneThroughInvitationFlow
    implements AbstractFutureLogic<bool, bool> {
  final UserInformationContract contract;

  UpdateHasGoneThroughInvitationFlow({required this.contract});

  @override
  call(params) async =>
      await contract.updateHasGoneThroughInvitationFlow(params);
}
