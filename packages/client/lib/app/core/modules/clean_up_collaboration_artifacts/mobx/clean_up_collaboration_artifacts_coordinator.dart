// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/domain/domain.dart';
import 'package:nokhte/app/modules/collaboration/presentation/presentation.dart';
part 'clean_up_collaboration_artifacts_coordinator.g.dart';

class CleanUpCollaborationArtifactsCoordinator = _CleanUpCollaborationArtifactsCoordinatorBase
    with _$CleanUpCollaborationArtifactsCoordinator;

abstract class _CleanUpCollaborationArtifactsCoordinatorBase
    extends BaseMobxDBStore<NoParams, bool> with Store {
  final CollaborationLogicCoordinator collaborationLogicCoordinator;
  final CleanUpNokhteSession cleanUpNokhteSession;

  _CleanUpCollaborationArtifactsCoordinatorBase({
    required this.collaborationLogicCoordinator,
    required this.cleanUpNokhteSession,
  });

  @override
  @action
  Future<void> call(NoParams params) async {
    state = StoreState.loading;
    await collaborationLogicCoordinator.exit();
    await cleanUpNokhteSession(NoParams());
    state = StoreState.loaded;
  }
}
