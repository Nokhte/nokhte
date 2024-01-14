import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class UpdateOnCallStatus
    implements
        AbstractFutureLogic<CallUpdateStatusEntity, UpdateOnCallStatusParams> {
  final CollaboratorPresenceContract contract;

  UpdateOnCallStatus({required this.contract});

  @override
  call(params) async => await contract.updateOnCallStatus(params);
}

class UpdateOnCallStatusParams extends Equatable {
  final bool shouldUpdateCollaboratorsIndex;
  final bool newStatus;

  const UpdateOnCallStatusParams({
    required this.newStatus,
    this.shouldUpdateCollaboratorsIndex = false,
  });

  @override
  List<Object> get props => [];
}
