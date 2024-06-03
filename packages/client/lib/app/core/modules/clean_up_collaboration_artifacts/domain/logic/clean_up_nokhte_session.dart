import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts.dart';

class CleanUpNokhteSession implements AbstractFutureLogic<bool, NoParams> {
  final CleanUpCollaborationArtifactsContract contract;

  CleanUpNokhteSession({required this.contract});

  @override
  call(params) async => await contract.cleanUpNokhteSession(params);
}
