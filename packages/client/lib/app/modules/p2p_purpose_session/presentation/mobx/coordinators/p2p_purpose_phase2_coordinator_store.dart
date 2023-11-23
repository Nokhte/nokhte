// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/mobx/one_talker_at_a_time_coordinator.dart';
import 'package:nokhte/app/core/modules/timer/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'p2p_purpose_phase2_coordinator_store.g.dart';

class P2PPurposePhase2CoordinatorStore = _P2PPurposePhase2CoordinatorStoreBase
    with _$P2PPurposePhase2CoordinatorStore;

abstract class _P2PPurposePhase2CoordinatorStoreBase extends BaseTimesUpStore
    with Store {
  final OneTalkerAtATimeCoordinator oneTalkerAtATime;
  final ExplanationTextStore explanationText;
  final AgoraCallbacksStore agoraCallbacksStore;
  final VoiceCallActionsStore voiceCallActionsStore;
  final CheckIfUserHasTheQuestionStore questionCheckerStore;
  final SmartFadingAnimatedTextTrackerStore fadingText;
  final MeshCircleButtonStore meshCircleStore;
  final SwipeDetector swipe;
  final HoldDetector hold;

  _P2PPurposePhase2CoordinatorStoreBase({
    required super.timer,
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
    beachWaves.initiateSuspendedAtTheDepths();
    await oneTalkerAtATime.startListeningToCheckIfCollaboratorIsTalking();
    holdStartListener();
    collaboratorIsTalkingListener();
    await timer.setupAndStreamListenerActivation(
        const CreateTimerParams(timerLengthInMinutes: 5), initOrPauseTimesUp);
    foregroundAndBackgroundStateListener();
    explanationText.setText("hold to talk");
    explanationText.widgetConstructor();
    beachWavesMovieModeWatcher();
    beachWavesMovieStatusWatcher();
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

  beachWavesMovieModeWatcher() => reaction((p0) => beachWaves.movieMode, (p0) {
        if (beachWaves.movieMode == BeachWaveMovieModes.backToTheDepthsSetup) {
          meshCircleStore.toggleWidgetVisibility();
        }
      });

  collaboratorIsTalkingListener() =>
      reaction((p0) => oneTalkerAtATime.collaboratorIsTalking, (p0) {
        if (p0) {
          meshCircleStore.toggleIsEnabled();
        } else if (!p0) {
          Future.delayed(
            Seconds.get(1),
            () => meshCircleStore.toggleIsEnabled(),
          );
        }
      });

  beachWavesMovieStatusWatcher() =>
      reaction((p0) => beachWaves.movieStatus, (p0) async {
        // print("${beachWaves.movieStatus} ${beachWaves.movieMode}");
        if (beachWaves.movieStatus == MovieStatus.inProgress &&
            beachWaves.movieMode == BeachWaveMovieModes.timesUp) {
          delayedNavigation(() => beachWaves.teeUpBackToTheDepths());
          // beachWaves.backToTheDepthsCount++;
        } else if (beachWaves.movieStatus == MovieStatus.inProgress &&
            beachWaves.movieMode == BeachWaveMovieModes.backToTheDepths) {
          await timer.deleteTheTimer(NoParams());
          await voiceCallActionsStore.enterOrLeaveCall(Left(NoParams()));
          await explanationText.toggleWidgetVisibility();
          if (fadingText.showText) {
            fadingText.fadeTheTextOut();
          }
          meshCircleStore.toggleWidgetVisibility();
          delayedNavigation(
              () => Modular.to.navigate('/p2p_purpose_session/phase-3/'));
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
        meshCircleStore.initGlowUp();
      }

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
