// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/presence_modules/modules/modules.dart';
import 'package:nokhte/app/core/modules/presence_modules/modules/shared/shared.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/mobx/mobx.dart';
import 'package:permission_handler/permission_handler.dart';
part 'purpose_session_phase1_coordinator.g.dart';

class PurposeSessionPhase1Coordinator = _PurposeSessionPhase1CoordinatorBase
    with _$PurposeSessionPhase1Coordinator;

abstract class _PurposeSessionPhase1CoordinatorBase extends BaseCoordinator
    with Store {
  final VoiceCallCoordinator voiceCall;
  final CollaboratorPresenceCoordinator collaboratorPresence;
  final PurposeSessionPhase1WidgetsCoordinator widgets;
  final CheckIfUserHasTheQuestionStore checkIfUserHasTheQuestion;
  final HoldDetector hold;
  final TapDetector tap;

  _PurposeSessionPhase1CoordinatorBase(
      {required this.widgets,
      required this.voiceCall,
      required this.collaboratorPresence,
      required this.checkIfUserHasTheQuestion,
      required this.hold,
      required this.tap});

  @observable
  bool canSpeak = false;

  @observable
  bool isFirstTimeBothAreInSync = true;

  @observable
  bool hasInitializedTimer = false;

  @observable
  int speakerCount = 0;

  @action
  constructor() async {
    setDisableAllTouchFeedback(true);
    widgets.constructor();
    initReactors();
    collaboratorPresence.setBasePhaseForScreen(1.0);
    await Permission.microphone.request();
    await voiceCall.joinCall(shouldEnterTheCallMuted: true);
    await collaboratorPresence.listen();
    collaboratorPresence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    await checkIfUserHasTheQuestion(NoParams());
    widgets.setHasTheQuesion(checkIfUserHasTheQuestion.hasTheQuestion);
    if (checkIfUserHasTheQuestion.hasTheQuestion) {
      widgets.hasTheQuestionConstructor();
      canSpeak = true;
    } else {
      widgets.doesNotHaveTheQuestionConstructor();
    }
  }

  @action
  onInactive() async {
    await collaboratorPresence.updateTimerStatus(false);
    await collaboratorPresence
        .updateOnlineStatus(UpdatePresencePropertyParams.userNegative());
  }

  @action
  onResumed() async {
    await collaboratorPresence.updateTimerStatus(true);
    await collaboratorPresence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    if (collaboratorPresence.getSessionMetadataStore.collaboratorIsOnline) {
      collaboratorPresence.incidentsOverlayStore.onCollaboratorJoined();
    }
  }

  @action
  onTimesUpCompleted() async {
    await collaboratorPresence.updateCurrentPhase(1.5);
    await voiceCall.leaveCall();
    await collaboratorPresence.dispose();
  }

  initReactors() {
    voiceCall.initReactors(onBothJoinedCall: () {
      setDisableAllTouchFeedback(false);
    });
    collaboratorPresence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
      },
      onCollaboratorLeft: () {
        setDisableAllTouchFeedback(true);
      },
    );
    // bothCollaboratorsAreOnCallAndOnlineReactor();
    collaboratorTalkingStatusReactor();
    userTalkingStatusReactor();
    holdReactor();
    letGoReactor();
    timerReactor();
    widgets.wifiDisconnectOverlayReactor(
      onConnectionFinished: () async {},
    );
    widgets.beachWavesMovieStatusReactor(
        onTimesUpCompleted: onTimesUpCompleted);
    tapReactor();
  }

  holdReactor() => reaction((p0) => hold.holdCount, (p0) async {
        ifTouchIsNotDisabled(() async {
          if (canSpeak &&
              voiceCall.voiceCallStatusStore.inCall == CallStatus.joined &&
              !widgets.isDisconnected &&
              collaboratorPresence
                  .getSessionMetadataStore.collaboratorIsOnline) {
            await collaboratorPresence
                .updateWhoIsTalking(UpdateWhoIsTalkingParams.setUserAsTalker);
          }
        });
      });

  letGoReactor() => reaction((p0) => hold.letGoCount, (p0) async {
        if (canSpeak &&
            voiceCall.voiceCallStatusStore.inCall == CallStatus.joined &&
            !widgets.isDisconnected &&
            collaboratorPresence.getSessionMetadataStore.collaboratorIsOnline) {
          await collaboratorPresence
              .updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
        }
      });

  collaboratorTalkingStatusReactor() => reaction(
          (p0) => collaboratorPresence
              .getSessionMetadataStore.collaboratorIsTalking, (p0) {
        if (p0) {
          speakerCount++;
          canSpeak = false;
        } else {
          if (!checkIfUserHasTheQuestion.hasTheQuestion && speakerCount == 1) {
            widgets.onFirstCollaboratorFinishSpeaking();
          }
          canSpeak = true;
        }
      });
  userTalkingStatusReactor() => reaction(
          (p0) => collaboratorPresence.getSessionMetadataStore.userIsTalking,
          (p0) async {
        if (p0) {
          await voiceCall.voiceCallActionsStore.unmuteAudio(NoParams());
          widgets.onHold();
          if (!hasInitializedTimer &&
              checkIfUserHasTheQuestion.hasTheQuestion) {
            await collaboratorPresence.updateTimerStatus(true);
            hasInitializedTimer = true;
            widgets.initTimer();
          }
        } else {
          widgets.onLetGo();
          await voiceCall.voiceCallActionsStore.muteAudio(NoParams());
        }
      });

  // bothCollaboratorsAreOnCallAndOnlineReactor() => reaction(
  //         (p0) => collaboratorPresence.getSessionMetadataStore
  //             .bothCollaboratorsAreOnCallAndOnline, (p0) {
  //       if (p0 && isFirstTimeBothAreInSync) {
  //         isFirstTimeBothAreInSync = false;
  //         widgets.onFirstTimeUsersAreInSync();
  //       }
  //     });

  timerReactor() => reaction(
          (p0) => collaboratorPresence.getSessionMetadataStore.timerShouldRun,
          (p0) {
        if (p0) {
          if (!hasInitializedTimer) {
            Timer.periodic(const Duration(seconds: 1), (timer) {
              if (collaboratorPresence
                      .getSessionMetadataStore.collaboratorIsOnline &&
                  voiceCall.voiceCallStatusStore.hasCollaboratorJoined) {
                widgets.initTimer();
                hasInitializedTimer = true;
                timer.cancel();
              }
            });
          } else {
            widgets.resumeTimer();
          }
        } else {
          widgets.pausetimer();
        }
      });

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        if (p0 == 9) {
          widgets.setTimerLength(Seconds.get(9));
        }
      });
}
