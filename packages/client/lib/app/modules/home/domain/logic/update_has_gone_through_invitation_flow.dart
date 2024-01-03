import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/domain/domain.dart';

class UpdateHasGoneThroughInvitationFlow
    implements
        AbstractFutureLogic<HasGoneThroughInvitationFlowUpdateStatusEntity,
            bool> {
  final HomeContract contract;

  UpdateHasGoneThroughInvitationFlow({required this.contract});

  @override
  call(params) async =>
      await contract.updateHasGoneThroughInvitationFlow(params);
}
