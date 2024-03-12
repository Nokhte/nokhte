import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/domain/domain.dart';

class DeleteIrlActiveNokhteSession
    implements AbstractFutureLogic<bool, NoParams> {
  final CleanUpCollaborationArtifactsContract contract;

  DeleteIrlActiveNokhteSession({required this.contract});

  @override
  call(params) async => await contract.deleteIrlActiveNokhteSession(params);
}
