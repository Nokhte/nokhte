import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';

class DeleteSoloDocument
    implements
        AbstractFutureLogic<CollaborationArtifactDeleteStatusEntity, NoParams> {
  final DeleteUnconsecratedCollaborationsContract contract;

  DeleteSoloDocument({required this.contract});

  @override
  call(params) async => await contract.deleteSoloDocument(params);
}
