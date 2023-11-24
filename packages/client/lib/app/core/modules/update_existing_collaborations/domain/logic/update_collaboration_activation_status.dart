import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/domain/domain.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/domain/entities/collaboration_activation_status_entity.dart';

class UpdateCollaborationActivationStatus
    implements AbstractFutureLogic<CollaborationActivationStatusEntity, bool> {
  final UpdateExistingCollaborationsConstract contract;

  UpdateCollaborationActivationStatus({required this.contract});

  @override
  call(params) async => await contract.updateCollaborationActivationStatus(
        shouldActivate: params,
      );
}
