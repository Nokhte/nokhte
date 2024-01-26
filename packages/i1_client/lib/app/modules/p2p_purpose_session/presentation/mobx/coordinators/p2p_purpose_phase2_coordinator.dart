// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/types/purpose_session_screens.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/mobx/one_talker_at_a_time_coordinator.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/coordinator/voice_call_coordinator.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_purpose_session/presentation/presentation.dart';
part 'p2p_purpose_phase2_coordinator.g.dart';

class P2PPurposePhase2Coordinator = _P2PPurposePhase2CoordinatorBase
    with _$P2PPurposePhase2Coordinator;

abstract class _P2PPurposePhase2CoordinatorBase extends BaseCoordinator
    with Store {
  final OneTalkerAtATimeCoordinator oneTalkerAtATime;
  final AbortPurposeSessionArtifactsStore abortPurposeSessionArtifactsStore;
  final VoiceCallCoordinator voiceCallCoordinator;
  final ExistingCollaborationsCoordinator existingCollaborations;
  final P2PPurposePhase2WidgetsCoordinator widgets;
  final SwipeDetector swipe;
  final HoldDetector hold;

  _P2PPurposePhase2CoordinatorBase({
    required this.existingCollaborations,
    required this.abortPurposeSessionArtifactsStore,
    required this.oneTalkerAtATime,
    required this.swipe,
    required this.hold,
    required this.voiceCallCoordinator,
    required this.widgets,
  });

  @observable
  bool isFirstTimeTalking = true;

  initListeners() {
    holdStartListener();
    collaboratorIsTalkingListener(
      ifCollaboratorIsTalking: widgets.disableMeshAndMirrorCollaboratorsGlow,
      ifCollaboratorIsDoneTalking: widgets.enableMeshAfterCooldownPeriod,
    );
    widgets.beachWavesMovieStatusWatcher(
      logicRelatedCallback: cleanUpAndTransition,
    );
    holdEndListener();
  }

  @action
  screenConstructor() async {
    initListeners();
    await oneTalkerAtATime.startListeningToCheckIfCollaboratorIsTalking();
    await existingCollaborations.checkIfUserHasTheQuestion(NoParams());
    final mainOnScreenMessage =
        existingCollaborations.checkIfUserHasTheQuestion.hasTheQuestion
            ? "Ask: What Could We Collectively Create?"
            : "Wait For Your Collaborator To Start The Conversation";
    widgets.constructor(mainOnScreenMessage: mainOnScreenMessage);
    // await timer.setupAndStreamListenerActivation(
    //   const CreateTimerParams(timerLengthInMinutes: 5),
    //   timerUICallback: widgets.initOrPauseTimesUp,
    //   onBothCollaboratorTimersCompleted: cleanUpAndTransition,
    // );
    foregroundAndBackgroundStateListener(
      // resumedCallback: () async => await timer.setOnlineStatus(true),
      // inactiveCallback: () async => await timer.setOnlineStatus(false),
      resumedCallback: () async => null,
      inactiveCallback: () async => null,
      detachedCallback: () async => await abortPurposeSessionArtifactsStore(
        const AbortPurposeSessionArtifactsParams(
          currentScreen: PurposeSessionScreens.phase2Consultation,
        ),
      ),
    );
  }

  collaboratorIsTalkingListener({
    required Function ifCollaboratorIsTalking,
    required Function ifCollaboratorIsDoneTalking,
  }) =>
      reaction((p0) => oneTalkerAtATime.collaboratorIsTalking, (p0) {
        if (p0) {
          ifCollaboratorIsTalking();
        } else if (!p0) {
          ifCollaboratorIsDoneTalking();
        }
      });

  cleanUpAndTransition() async {
    // await timer.deleteTheTimer(NoParams());
    await voiceCallCoordinator.leaveCall();
  }

  holdStartListener() => reaction(
        (p0) => hold.holdCount,
        (p0) => audioButtonHoldStartCallback(),
      );

  holdEndListener() => reaction(
        (p0) => hold.letGoCount,
        (p0) => audioButtonHoldEndCallback(),
      );

  @action
  audioButtonHoldStartCallback() async {
    widgets.audioButtonHoldStartCallback(
        firstTimeTalkingCallback: () async => null,
        // await timer.updateTimerRunningStatus(true),
        everyTimeCallback: () async {
          oneTalkerAtATime.markUserAsTheTalker();
          voiceCallCoordinator.unmute();
        });
  }

  @action
  audioButtonHoldEndCallback() {
    widgets.audioButtonHoldEndCallback(ifMeshIsEnabledCallback: () async {
      await oneTalkerAtATime.clearOutTalkerRow();
      await voiceCallCoordinator.mute();
    });
  }
}
