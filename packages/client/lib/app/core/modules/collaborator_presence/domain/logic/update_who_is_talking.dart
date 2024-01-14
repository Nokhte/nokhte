import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class UpdateWhoIsTalking
    implements
        AbstractFutureLogic<WhoIsTalkingUpdateStatusEntity,
            UpdateWhoIsTalkingParams> {
  final CollaboratorPresenceContract contract;

  UpdateWhoIsTalking({required this.contract});

  @override
  call(params) async => await contract.updateWhoIsTalking(params);
}

enum UpdateWhoIsTalkingParams {
  clearOut,
  setUserAsTalker,
}
