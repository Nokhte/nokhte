import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/purpose_session/domain/domain.dart';

class DeleteCollaborativeDocument
    implements
        AbstractFutureLogic<CollaborationArtifactDeleteStatusEntity, NoParams> {
  final PurposeSessionContract contract;

  DeleteCollaborativeDocument({required this.contract});

  @override
  call(params) async => await contract.deleteCollaborativeDocument(params);
}
