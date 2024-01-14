import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/purpose_session/domain/domain.dart';

class DeleteSoloDocument
    implements
        AbstractFutureLogic<CollaborationArtifactDeleteStatusEntity, NoParams> {
  final PurposeSessionContract contract;

  DeleteSoloDocument({required this.contract});

  @override
  call(params) async => await contract.deleteSoloDocument(params);
}
