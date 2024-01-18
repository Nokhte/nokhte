import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';

class DeleteTheCollaboration
    implements
        AbstractFutureLogic<CollaborationArtifactDeleteStatusEntity, NoParams> {
  final DeleteUnconsecratedCollaborationsContract contract;

  DeleteTheCollaboration({required this.contract});

  @override
  call(params) async => await contract.deleteTheCollaboration(params);
}
