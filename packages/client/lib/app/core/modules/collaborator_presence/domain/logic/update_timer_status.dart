import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class UpdateTimerStatus
    implements AbstractFutureLogic<TimerUpdateStatusEntity, bool> {
  final CollaboratorPresenceContract contract;

  UpdateTimerStatus({required this.contract});

  @override
  call(params) async => await contract.updateTimerStatus(params);
}
