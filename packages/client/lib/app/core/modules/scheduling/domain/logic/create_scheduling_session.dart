import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/scheduling/domain/domain.dart';

class CreateSchedulingSession
    implements
        AbstractFutureLogic<SchedulingSessionCreationStatusEntity, NoParams> {
  final SchedulingContract contract;

  CreateSchedulingSession({required this.contract});

  @override
  call(params) async =>
      await contract.createCollaborativeSchedulingSession(params);
}
