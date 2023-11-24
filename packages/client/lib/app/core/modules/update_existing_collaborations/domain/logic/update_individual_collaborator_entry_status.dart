import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/domain/domain.dart';

class UpdateIndividualCollaboratorEntryStatus
    implements
        AbstractFutureLogic<IndividualCollaboratorEntryStatusEntity, bool> {
  final UpdateExistingCollaborationsContract contract;

  UpdateIndividualCollaboratorEntryStatus({required this.contract});

  @override
  call(params) async => await contract.updateIndividualCollaboratorEntryStatus(
      isEntering: params);
}
