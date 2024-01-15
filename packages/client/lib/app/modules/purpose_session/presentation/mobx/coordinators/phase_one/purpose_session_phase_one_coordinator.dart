// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/mobx/mobx.dart';
import 'package:nokhte/app/modules/purpose_session/types/purpose_session_screen.dart';
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

  _PurposeSessionPhaseOneCoordinatorBase({
    required this.widgets,
    required this.voiceCall,
    required this.collaboratorPresence,
    required this.deleteCollaborationArtifacts,
    required this.checkIfUserHasTheQuestion,
  });

  @observable
  bool isFirstTimeBothAreInSync = true;

  @action
  constructor() async {
    widgets.constructor();
    widgets.onCallLeft();
    voiceCall.joinCall(shouldEnterTheCallMuted: true);
    initReactors();
    collaboratorPresence.updateOnlineStatus(const UpdateOnlineStatusParams(
      newStatus: true,
    ));
    await collaboratorPresence.getSessionMetadata(NoParams());
    await checkIfUserHasTheQuestion(NoParams());
    widgets.setHasTheQuesion(checkIfUserHasTheQuestion.hasTheQuestion);
  }

  initReactors() {
    onCallStatusChangeReactor();
    onCollaboratorCallPresenceChangeReactor();
    bothCollaboratorsAreOnCallAndOnlineReactor();
    // timerReactor();
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
          await collaboratorPresence.updateTimerStatus(true);
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

  // timerReactor() =>
  //     reaction((p0) => collaboratorPresence.getSessionMetadata.timerShouldRun,
  //         (p0) {
  //       if (p0) {
  //         if (isFirstTimeInitializingTimer) {
  //           Timer.periodic(const Duration(seconds: 1), (timer) {
  //             if (collaboratorPresence
  //                     .getSessionMetadata.collaboratorIsOnCall &&
  //                 collaboratorPresence
  //                     .getSessionMetadata.collaboratorIsOnline) {
  //               widgets.initTimer();
  //               isFirstTimeInitializingTimer = false;
  //               timer.cancel();
  //             }
  //           });
  //         } else {
  //           widgets.resumeTimer();
  //         }
  //       } else {
  //         widgets.pausetimer();
  //       }
  //     });
}
