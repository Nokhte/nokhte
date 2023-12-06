// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/types/types.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';
import 'package:nokhte/app/core/modules/timer/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/mobx.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/mobx/mobx.dart';
part 'p2p_purpose_phase3_coordinator.g.dart';

class P2PPurposePhase3Coordinator = _P2PPurposePhase3CoordinatorBase
    with _$P2PPurposePhase3Coordinator;

abstract class _P2PPurposePhase3CoordinatorBase extends BaseCoordinator
    with Store {
  final AbortPurposeSessionArtifactsStore abortPurposeSessionArtifactsStore;
  final P2PPurposePhase3WidgetsCoordinator widgets;
  final SoloDocCoordinator soloDoc;
  final SwipeDetector swipe;
  final TimerCoordinator timer;

  _P2PPurposePhase3CoordinatorBase({
    required this.timer,
    required this.swipe,
    required this.widgets,
    required this.abortPurposeSessionArtifactsStore,
    required this.soloDoc,
  });

  cleanUpAndTransition() async {
    final currentText = widgets.textEditor.controller.text;
    await timer.deleteTheTimer(NoParams());
    await soloDoc.createSoloDoc(const CreateSoloDocParams(docType: 'purpose'));
    await soloDoc.submitSoloDoc(SubmitSoloDocParams(content: currentText));
    await soloDoc.shareSoloDoc(NoParams());
  }

  @action
  screenConstructor() async {
    widgets.beachWavesMovieStatusWatcher(
      onTimesUpComplete: cleanUpAndTransition,
    );
    widgets.constructor();
    foregroundAndBackgroundStateListener(
      resumedCallback: () async => await timer.setOnlineStatus(true),
      inactiveCallback: () async => await timer.setOnlineStatus(false),
      detachedCallback: () async => await abortPurposeSessionArtifactsStore(
        const AbortPurposeSessionArtifactsParams(
          currentScreen: PurposeSessionScreens.phase3IndividualReflection,
        ),
      ),
    );
    await timer.setupAndStreamListenerActivation(
      const CreateTimerParams(timerLengthInMinutes: 5),
      timerUICallback: widgets.initOrPauseTimesUp,
      onBothCollaboratorTimersCompleted: cleanUpAndTransition,
    );
    await timer.updateTimerRunningStatus(true);
  }

  @override
  List<Object> get props => [];
}
