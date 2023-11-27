import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/domain/domain.dart';

class UpdateCollaborationActivationStatus
    implements AbstractFutureLogic<CollaborationActivationStatusEntity, bool> {
  final ExistingCollaborationsContract contract;

  UpdateCollaborationActivationStatus({required this.contract});

  @override
  call(params) async => await contract.updateCollaborationActivationStatus(
        shouldActivate: params,
      );
}
