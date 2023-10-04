import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/scheduling/domain/domain.dart';

class CreateSchedulingSession
    implements
        AbstractFutureLogic<SchedulingSessionCreationStatusEntity, NoParams> {
  final SchedulingContract contract;

  CreateSchedulingSession({required this.contract});

  @override
  call(params) async =>
      await contract.createCollaborativeSchedulingSession(params);
}
