import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class UpdateCurrentPhase
    implements
        AbstractFutureLogic<PhaseUpdateStatusEntity, UpdateCurrentPhaseParams> {
  final CollaboratorPresenceContract contract;

  UpdateCurrentPhase({required this.contract});

  @override
  call(params) async => await contract.updateCurrentPhase(params);
}

class UpdateCurrentPhaseParams extends Equatable {
  final bool shouldUpdateCollaboratorsIndex;
  final int newPhase;

  const UpdateCurrentPhaseParams({
    required this.newPhase,
    this.shouldUpdateCollaboratorsIndex = false,
  });

  @override
  List<Object> get props => [
        shouldUpdateCollaboratorsIndex,
        newPhase,
      ];
}
