// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/active_monetization_session/active_monetization_session.dart';
import 'package:nokhte/app/core/modules/clean_up_collaboration_artifacts/clean_up_collaboration_artifacts.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
part 'clean_up_collaboration_artifacts_coordinator.g.dart';

class CleanUpCollaborationArtifactsCoordinator = _CleanUpCollaborationArtifactsCoordinatorBase
    with _$CleanUpCollaborationArtifactsCoordinator;

abstract class _CleanUpCollaborationArtifactsCoordinatorBase
    with Store, BaseMobxLogic<NoParams, bool> {
  final SessionStartersLogicCoordinator sessionStarters;
  final CleanUpNokhteSession cleanUpNokhteSession;
  final ActiveMonetizationSessionCoordinator activeMonetizationSession;

  _CleanUpCollaborationArtifactsCoordinatorBase({
    required this.sessionStarters,
    required this.cleanUpNokhteSession,
    required this.activeMonetizationSession,
  }) {
    initBaseLogicActions();
  }

  @override
  @action
  Future<void> call(NoParams params) async {
    try {
      setState(StoreState.loading);
      await sessionStarters.nuke();
      await activeMonetizationSession.delete();
      await cleanUpNokhteSession(NoParams());
      setState(StoreState.loaded);
    } catch (e) {
      //
    }
  }
}
