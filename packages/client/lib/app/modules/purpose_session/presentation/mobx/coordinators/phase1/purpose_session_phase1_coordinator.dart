// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/mobx/mobx.dart';
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
    widgets.constructor();
    widgets.onCallLeft();
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
  }

  @action
  onTimesUpCompleted() async {
    await collaboratorPresence.updateCurrentPhase(1.5);
    await voiceCall.leaveCall();
    await collaboratorPresence.dispose();
  }

  initReactors() {
    onCallStatusChangeReactor();
    onCollaboratorCallPresenceChangeReactor();
    bothCollaboratorsAreOnCallAndOnlineReactor();
    collaboratorTalkingStatusReactor();
    userTalkingStatusReactor();
    holdReactor();
    letGoReactor();
    timerReactor();
    onCollaboratorCallStatusChangeReactor();
    widgets.wifiDisconnectOverlayReactor(
      onConnectionFinished: () async {
        await collaboratorPresence
            .updateCallStatus(UpdatePresencePropertyParams.userAffirmative());
      },
    );
    widgets.beachWavesMovieStatusReactor(
        onTimesUpCompleted: onTimesUpCompleted);
    tapReactor();
  }

  holdReactor() => reaction((p0) => hold.holdCount, (p0) async {
        if (canSpeak &&
            voiceCall.voiceCallStatusStore.inCall == CallStatus.joined &&
            !widgets.isDisconnected &&
            collaboratorPresence.getSessionMetadataStore.collaboratorIsOnline) {
          await collaboratorPresence
              .updateWhoIsTalking(UpdateWhoIsTalkingParams.setUserAsTalker);
        }
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

  onCallStatusChangeReactor() =>
      reaction((p0) => voiceCall.voiceCallStatusStore.inCall, (p0) async {
        if (p0 == CallStatus.joined) {
          widgets.onCallJoined();
          await collaboratorPresence
              .updateCallStatus(UpdatePresencePropertyParams.userAffirmative());
        } else if (p0 == CallStatus.left) {
          if (!collaboratorPresence
              .getSessionMetadataStore.collaboratorHasMovedOn) {
            widgets.onCallLeft();
          }
          await collaboratorPresence
              .updateCallStatus(UpdatePresencePropertyParams.userNegative());
        }
      });

  onCollaboratorCallStatusChangeReactor() =>
      reaction((p0) => voiceCall.voiceCallStatusStore.hasCollaboratorJoined,
          (p0) async {
        if (p0) {
          await collaboratorPresence.updateCallStatus(
              UpdatePresencePropertyParams.collaboratorAffirmative());
        } else {
          if (!collaboratorPresence
              .getSessionMetadataStore.collaboratorHasMovedOn) {
            widgets.onCallLeft();
          }
          await collaboratorPresence.updateCallStatus(
              UpdatePresencePropertyParams.collaboratorNegative());
        }
      });

  onCollaboratorCallPresenceChangeReactor() => reaction(
          (p0) =>
              collaboratorPresence.getSessionMetadataStore.collaboratorIsOnline,
          (p0) async {
        if (p0) {
          widgets.onCollaboratorJoined();
        } else {
          widgets.onCollaboratorLeft();
          await collaboratorPresence.updateCallStatus(
              UpdatePresencePropertyParams.collaboratorNegative());
        }
      });

  bothCollaboratorsAreOnCallAndOnlineReactor() => reaction(
          (p0) => collaboratorPresence.getSessionMetadataStore
              .bothCollaboratorsAreOnCallAndOnline, (p0) {
        if (p0 && isFirstTimeBothAreInSync) {
          isFirstTimeBothAreInSync = false;
          widgets.onFirstTimeUsersAreInSync();
        }
      });

  timerReactor() => reaction(
          (p0) => collaboratorPresence.getSessionMetadataStore.timerShouldRun,
          (p0) {
        if (p0) {
          if (!hasInitializedTimer) {
            Timer.periodic(const Duration(seconds: 1), (timer) {
              if (collaboratorPresence
                      .getSessionMetadataStore.collaboratorIsOnCall &&
                  collaboratorPresence
                      .getSessionMetadataStore.collaboratorIsOnline) {
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
