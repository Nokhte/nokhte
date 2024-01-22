import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class UpdateCurrentPhase implements AbstractFutureLogic<bool, double> {
  final CollaboratorPresenceContract contract;

  UpdateCurrentPhase({required this.contract});

  @override
  call(params) async => await contract.updateCurrentPhase(params);
}
