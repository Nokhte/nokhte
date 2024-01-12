// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/types/types.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
// import 'package:nokhte/app/core/modules/timer/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/mobx/mobx.dart';
// import 'package:nokhte/app/core/modules/timer/mobx/mobx.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/widget_coordinators/p2p_purpose_phase4_widgets_coordinator.dart';
part 'p2p_purpose_phase4_coordinator.g.dart';

class P2PPurposePhase4Coordinator = _P2PPurposePhase4CoordinatorBase
    with _$P2PPurposePhase4Coordinator;

abstract class _P2PPurposePhase4CoordinatorBase extends BaseCoordinator
    with Store {
  final AbortPurposeSessionArtifactsStore abortPurposeSessionArtifactsStore;
  final SoloDocCoordinator soloDoc;
  // final TimerCoordinator timer;
  final P2PPurposePhase4WidgetsCoordinator widgets;

  _P2PPurposePhase4CoordinatorBase({
    // required this.timer,
    required this.widgets,
    required this.abortPurposeSessionArtifactsStore,
    required this.soloDoc,
  });

  @action
  cleanUpAndTransition() async => null;
  // await timer.deleteTheTimer(NoParams());

  @action
  screenConstructor() async {
    await soloDoc.getSoloDoc(const GetSoloDocParams(getCollaboratorsDoc: true));
    widgets.beachWavesMovieStatusWatcher(
        onTimesUpComplete: cleanUpAndTransition);
    widgets.constructor(collaboratorsDocContent: soloDoc.getSoloDoc.docContent);
    foregroundAndBackgroundStateListener(
      resumedCallback: () async => null,
      inactiveCallback: () async => null,
      detachedCallback: () async => await abortPurposeSessionArtifactsStore(
        const AbortPurposeSessionArtifactsParams(
          currentScreen: PurposeSessionScreens.phase4ReciprocateAttention,
        ),
      ),
    );
  }
}
