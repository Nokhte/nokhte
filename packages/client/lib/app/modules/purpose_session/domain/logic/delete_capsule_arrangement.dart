import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/purpose_session/domain/domain.dart';

class DeleteCapsuleArrangement
    implements
        AbstractFutureLogic<CollaborationArtifactDeleteStatusEntity, NoParams> {
  final PurposeSessionContract contract;

  DeleteCapsuleArrangement({required this.contract});

  @override
  call(params) async => await contract.deleteCapsuleArrangement(params);
}
