import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';

class GetCollaboratorIndividualSessionMetadata
    implements
        AbstractFutureLogic<CollaboratorIndividualSessionMetadataEntity,
            NoParams> {
  final CollectiveSessionContract contract;

  GetCollaboratorIndividualSessionMetadata({required this.contract});

  @override
  call(params) async =>
      await contract.getCollaboratorIndividualSessionMetadata(params);
}
