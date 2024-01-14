import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class UpdateOnlineStatus
    implements
        AbstractFutureLogic<OnlineUpdateStatusEntity,
            UpdateOnlineStatusParams> {
  final CollaboratorPresenceContract contract;

  UpdateOnlineStatus({required this.contract});

  @override
  call(params) async => await contract.updateOnlineStatus(params);
}

class UpdateOnlineStatusParams extends Equatable {
  final bool shouldUpdateCollaboratorsIndex;
  final bool newStatus;

  const UpdateOnlineStatusParams({
    required this.newStatus,
    this.shouldUpdateCollaboratorsIndex = false,
  });

  @override
  List<Object> get props => [];
}
