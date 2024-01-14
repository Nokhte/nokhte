import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/purpose_session/domain/domain.dart';

class DeleteTheCollaboration
    implements
        AbstractFutureLogic<CollaborationArtifactDeleteStatusEntity, NoParams> {
  final PurposeSessionContract contract;

  DeleteTheCollaboration({required this.contract});

  @override
  call(params) async => await contract.deleteTheCollaboration(params);
}
