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
import 'package:nokhte/app/modules/purpose_session/types/purpose_session_screen.dart';
import 'package:permission_handler/permission_handler.dart';
part 'purpose_session_phase_one_coordinator.g.dart';

class PurposeSessionPhaseOneCoordinator = _PurposeSessionPhaseOneCoordinatorBase
    with _$PurposeSessionPhaseOneCoordinator;

abstract class _PurposeSessionPhaseOneCoordinatorBase extends BaseCoordinator
    with Store {
  final VoiceCallCoordinator voiceCall;
  final CollaboratorPresenceCoordinator collaboratorPresence;
  final DeleteCollaborationArtifactsStore deleteCollaborationArtifacts;
  final PurposeSessionPhaseOneWidgetsCoordinator widgets;
  final CheckIfUserHasTheQuestionStore checkIfUserHasTheQuestion;
  final HoldDetector hold;

  _PurposeSessionPhaseOneCoordinatorBase({
    required this.widgets,
    required this.voiceCall,
    required this.collaboratorPresence,
    required this.deleteCollaborationArtifacts,
    required this.checkIfUserHasTheQuestion,
    required this.hold,
  });

  @observable
  bool canSpeak = false;

  @observable
  bool isFirstTimeBothAreInSync = true;

  @observable
  bool isFirstTimeInitializingTimer = true;

  @observable
  int speakerCount = 0;

  @action
  constructor() async {
    widgets.constructor();
    widgets.onCallLeft();
    initReactors();
    await Permission.microphone.request();
    await voiceCall.joinCall(shouldEnterTheCallMuted: true);
    await collaboratorPresence.getSessionMetadata(NoParams());
    collaboratorPresence.updateOnlineStatus(const UpdateOnlineStatusParams(
      newStatus: true,
    ));
    await checkIfUserHasTheQuestion(NoParams());
    widgets.setHasTheQuesion(checkIfUserHasTheQuestion.hasTheQuestion);
    if (checkIfUserHasTheQuestion.hasTheQuestion) {
      canSpeak = true;
    }
  }

  @action
  onInactive() async {
    await collaboratorPresence.updateTimerStatus(false);
    await collaboratorPresence
        .updateOnlineStatus(const UpdateOnlineStatusParams(
      newStatus: false,
    ));
  }

  @action
  onResumed() async {
    await collaboratorPresence.updateTimerStatus(true);
    await collaboratorPresence
        .updateOnlineStatus(const UpdateOnlineStatusParams(
      newStatus: true,
    ));
  }

  @action
  onDetached() async => await deleteCollaborationArtifacts(
      PurposeSessionScreen.phase1Consultation);

  initReactors() {
    onCallStatusChangeReactor();
    onCollaboratorCallPresenceChangeReactor();
    bothCollaboratorsAreOnCallAndOnlineReactor();
    oneTalkerAtATimeReactor();
    holdReactor();
    letGoReactor();
    timerReactor();
    widgets.wifiDisconnectOverlayReactor(
      onConnectionFinished: () async {
        await collaboratorPresence.updateOnCallStatus(
            const UpdateOnCallStatusParams(newStatus: true));
      },
    );
  }

  holdReactor() => reaction((p0) => hold.holdCount, (p0) async {
        if (canSpeak &&
            voiceCall.voiceCallStatus.inCall == CallStatus.joined &&
            !widgets.isDisconnected &&
            collaboratorPresence.getSessionMetadata.collaboratorIsOnline) {
          widgets.onHold();
          await collaboratorPresence
              .updateWhoIsTalking(UpdateWhoIsTalkingParams.setUserAsTalker);
          await voiceCall.voiceCallActions.unmuteAudio(NoParams());
          if (isFirstTimeInitializingTimer) {
            await collaboratorPresence.updateTimerStatus(true);
          }
        }
      });

  letGoReactor() => reaction((p0) => hold.letGoCount, (p0) async {
        if (canSpeak &&
            voiceCall.voiceCallStatus.inCall == CallStatus.joined &&
            !widgets.isDisconnected &&
            collaboratorPresence.getSessionMetadata.collaboratorIsOnline) {
          widgets.onLetGo();

          await collaboratorPresence
              .updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
          await voiceCall.voiceCallActions.muteAudio(NoParams());
        }
      });

  oneTalkerAtATimeReactor() => reaction(
          (p0) => collaboratorPresence.getSessionMetadata.collaboratorIsTalking,
          (p0) {
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

  onCallStatusChangeReactor() =>
      reaction((p0) => voiceCall.voiceCallStatus.inCall, (p0) async {
        if (p0 == CallStatus.joined) {
          widgets.onCallJoined();
          await collaboratorPresence.updateOnCallStatus(
              const UpdateOnCallStatusParams(newStatus: true));
        } else if (p0 == CallStatus.left) {
          widgets.onCallLeft();
          await collaboratorPresence.updateOnCallStatus(
              const UpdateOnCallStatusParams(newStatus: false));
        }
      });

  onCollaboratorCallPresenceChangeReactor() => reaction(
          (p0) => collaboratorPresence.getSessionMetadata.collaboratorIsOnline,
          (p0) async {
        if (p0) {
          widgets.onCollaboratorJoined();
        } else {
          widgets.onCollaboratorLeft();
          await collaboratorPresence
              .updateOnCallStatus(const UpdateOnCallStatusParams(
            newStatus: false,
            shouldUpdateCollaboratorsIndex: true,
          ));
        }
      });

  bothCollaboratorsAreOnCallAndOnlineReactor() => reaction(
          (p0) => collaboratorPresence
              .getSessionMetadata.bothCollaboratorsAreOnCallAndOnline, (p0) {
        if (p0 && isFirstTimeBothAreInSync) {
          isFirstTimeBothAreInSync = false;
          widgets.onFirstTimeUsersAreInSync();
        }
      });

  timerReactor() =>
      reaction((p0) => collaboratorPresence.getSessionMetadata.timerShouldRun,
          (p0) {
        if (p0) {
          if (isFirstTimeInitializingTimer) {
            Timer.periodic(const Duration(seconds: 1), (timer) {
              if (collaboratorPresence
                      .getSessionMetadata.collaboratorIsOnCall &&
                  collaboratorPresence
                      .getSessionMetadata.collaboratorIsOnline) {
                widgets.initTimer();
                isFirstTimeInitializingTimer = false;
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
}
