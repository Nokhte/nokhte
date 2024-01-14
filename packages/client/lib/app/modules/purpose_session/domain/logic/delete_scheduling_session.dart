import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/purpose_session/domain/domain.dart';

class DeleteSchedulingSession
    implements
        AbstractFutureLogic<CollaborationArtifactDeleteStatusEntity, NoParams> {
  final PurposeSessionContract contract;

  DeleteSchedulingSession({required this.contract});

  @override
  call(params) async => await contract.deleteSchedulingSession(params);
}
