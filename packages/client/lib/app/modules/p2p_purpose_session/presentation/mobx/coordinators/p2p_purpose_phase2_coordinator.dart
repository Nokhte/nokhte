// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/domain/domain.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/types/purpose_session_screens.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/mobx/one_talker_at_a_time_coordinator.dart';
import 'package:nokhte/app/core/modules/timer/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'p2p_purpose_phase2_coordinator.g.dart';

class P2PPurposePhase2Coordinator = _P2PPurposePhase2CoordinatorBase
    with _$P2PPurposePhase2Coordinator;

abstract class _P2PPurposePhase2CoordinatorBase extends BaseTimesUpStore
    with Store {
  // final NewBeachWavesStore newBeachWaves;
  final OneTalkerAtATimeCoordinator oneTalkerAtATime;
  final ExplanationTextStore explanationText;
  final AbortPurposeSessionArtifactsStore abortPurposeSessionArtifactsStore;
  final AgoraCallbacksStore agoraCallbacksStore;
  final VoiceCallActionsStore voiceCallActionsStore;
  final CheckIfUserHasTheQuestionStore questionCheckerStore;
  final SmartFadingAnimatedTextTrackerStore fadingText;
  final MeshCircleButtonStore meshCircleStore;
  final SwipeDetector swipe;
  final HoldDetector hold;

  _P2PPurposePhase2CoordinatorBase({
    required super.timer,
    required super.newBeachWaves,
    required this.abortPurposeSessionArtifactsStore,
    required this.oneTalkerAtATime,
    required this.swipe,
    required this.hold,
    required this.agoraCallbacksStore,
    required this.questionCheckerStore,
    required this.voiceCallActionsStore,
    required super.beachWaves,
    required this.explanationText,
    required this.fadingText,
    required this.meshCircleStore,
  }) : super(productionTimerLength: const Duration(minutes: 5));

  @observable
  bool isFirstTimeTalking = true;

  @action
  screenConstructor() async {
    fadingText.startRotatingText(Seconds.get(0));
    await oneTalkerAtATime.startListeningToCheckIfCollaboratorIsTalking();
    holdStartListener();
    collaboratorIsTalkingListener();
    beachWavesMovieStatusWatcher();
    newBeachWaves.setMovieMode(BeachWaveMovieModes.timesUp);
    await timer.setupAndStreamListenerActivation(
      const CreateTimerParams(timerLengthInMinutes: 5),
      timerUICallback: initOrPauseTimesUp,
      onBothCollaboratorTimersCompleted: cleanUpAndTransition,
    );
    foregroundAndBackgroundStateListener(
      resumedCallback: () async => await timer.setOnlineStatus(true),
      inactiveCallback: () async => await timer.setOnlineStatus(false),
      detachedCallback: () async => await abortPurposeSessionArtifactsStore(
        const AbortPurposeSessionArtifactsParams(
          currentScreen: PurposeSessionScreens.phase2Consultation,
        ),
      ),
    );
    explanationText.widgetConstructor(message: "hold to talk");
    holdEndListener();
    meshCircleStore.widgetConstructor();
    await fadingText
        .oneSecondDelay(() async => await fadingText.fadeTheTextIn());
    await questionCheckerStore(NoParams()).then((_) {
      fadingText.setMainMessage(
        index: 1,
        thePhrase: questionCheckerStore.hasTheQuestion
            ? "Ask: What Could We Collectively Create?"
            : "Wait For Your Collaborator To Start The Conversation",
      );
    }).then((value) => Future.delayed(Seconds.get(1), () {
          fadingText.togglePause();
        }));
  }

  collaboratorIsTalkingListener() =>
      reaction((p0) => oneTalkerAtATime.collaboratorIsTalking, (p0) {
        if (p0) {
          meshCircleStore.toggleIsEnabled();
          meshCircleStore.initGlowUp();
        } else if (!p0) {
          Future.delayed(
            Seconds.get(1),
            () {
              meshCircleStore.toggleIsEnabled();
              meshCircleStore.initGlowDown();
            },
          );
        }
      });

  cleanUpAndTransition() async {
    await timer.deleteTheTimer(NoParams());
    await voiceCallActionsStore.enterOrLeaveCall(Left(NoParams()));
    await explanationText.toggleWidgetVisibility();
    await timer.markTimerAsComplete(NoParams());
    if (fadingText.showText) {
      fadingText.fadeTheTextOut();
    }
    if (explanationText.showWidget) {
      explanationText.toggleWidgetVisibility();
    }
    meshCircleStore.toggleWidgetVisibility();
    Modular.to.navigate('/p2p_purpose_session/phase-3/');
  }

  beachWavesMovieStatusWatcher() =>
      reaction((p0) => newBeachWaves.movieStatus, (p0) async {
        print(" phase 2$p0 ${beachWaves.movieMode}");
        if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode == BeachWaveMovieModes.timesUp) {
          newBeachWaves.setMovieMode(BeachWaveMovieModes.timesUpEndToTheDepths);
          newBeachWaves.currentStore.initMovie(NoParams());
          await cleanUpAndTransition();
        }
      });

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
    if (meshCircleStore.isEnabled) {
      if (isFirstTimeTalking) {
        isFirstTimeTalking = false;
        Future.delayed(
          Seconds.get(3),
          () => explanationText.toggleWidgetVisibility(),
        );
        await timer.updateTimerRunningStatus(true);
      }
      meshCircleStore.initGlowUp();

      if (fadingText.currentIndex == 1 && fadingText.showText) {
        Future.delayed(Seconds.get(10), () => fadingText.fadeTheTextOut());
      }
      oneTalkerAtATime.markUserAsTheTalker();
      voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: false);
      meshCircleStore.toggleColorAnimation();
    }
  }

  @action
  audioButtonHoldEndCallback() {
    if (meshCircleStore.isEnabled) {
      oneTalkerAtATime.clearOutTalkerRow();
      meshCircleStore.initGlowDown();
      voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: true);
      meshCircleStore.toggleColorAnimation();
    }
  }

  @override
  List<Object> get props => [];
}
