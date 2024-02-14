// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/nokhte_session/domain/logic/change_desire_to_leave.dart';
import 'package:nokhte/app/modules/nokhte_session/presentation/mobx/coordinators/logic/nokhte_session_logic_coordinator.dart';
import 'package:nokhte/app/modules/nokhte_session/types/question_index_type.dart';
import 'package:permission_handler/permission_handler.dart';
import 'nokhte_session_phase1_widgets_coordinator.dart';
part 'nokhte_session_phase1_coordinator.g.dart';

class NokhteSessionPhase1Coordinator = _NokhteSessionPhase1CoordinatorBase
    with _$NokhteSessionPhase1Coordinator;

abstract class _NokhteSessionPhase1CoordinatorBase extends BaseCoordinator
    with Store {
  final NokhteSessionPhase1WidgetsCoordinator widgets;
  final NokhteSessionPresenceCoordinator presence;
  final VoiceCallCoordinator voiceCall;
  final HoldDetector hold;
  final SwipeDetector swipe;
  final NokhteSessionLogicCoordinator logic;

  _NokhteSessionPhase1CoordinatorBase({
    required this.widgets,
    required this.presence,
    required this.voiceCall,
    required this.hold,
    required this.swipe,
    required this.logic,
  });

  @observable
  bool canSpeak = false;

  @observable
  bool hasSwipedUp = false;

  @observable
  bool canSwipeUp = false;

  @observable
  int speakerCount = 0;

  @observable
  bool isTransitioningHome = false;

  @observable
  QuestionIndexType questionIndexType = QuestionIndexType.initial;

  @computed
  bool get speakerCountIsOdd => speakerCount % 2 == 1;

  @computed
  bool get speakerCountIsEven => speakerCount % 2 == 0;

  @computed
  bool get hasEvenSpeakerCounts => questionIndexType == QuestionIndexType.even;

  @computed
  bool get shouldIncrementSpeakerCount =>
      questionIndexType == QuestionIndexType.even
          ? speakerCountIsEven
          : speakerCountIsOdd;

  @action
  constructor() async {
    setDisableAllTouchFeedback(true);
    widgets.constructor();
    await logic.changeDesireToLeaveLogic(ChangeDesireToLeaveParams.negative);
    await Permission.microphone.request();
    await voiceCall.joinCall(
      shouldEnterTheCallMuted: true,
      callType: GetChannelIdParams.forNokhteSession,
    );
    initReactors();

    await logic.checkIfUserHasTheQuestion();
    widgets.setHasTheQuesion(logic.hasTheQuestion);
    if (logic.hasTheQuestion) {
      questionIndexType = QuestionIndexType.even;
      widgets.showSecondaryText();
      canSpeak = true;
    } else {
      questionIndexType = QuestionIndexType.odd;
      canSpeak = true;
    }
    await logic.changeDesireToLeaveLogic(ChangeDesireToLeaveParams.negative);
  }

  @action
  onInactive() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userNegative());
    await presence.updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
  }

  @action
  onResumed() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    if (presence.getSessionMetadataStore.collaboratorIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
    if (!widgets.isDisconnected) {}
  }

  initReactors() {
    speakerCountReactor();
    voiceCall.initReactors(onBothJoinedCall: () async {
      await presence
          .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
      await presence.listen();
      setDisableAllTouchFeedback(false);
      canSwipeUp = true;
    });
    presence.initReactors(
      onCollaboratorJoined: () {
        setDisableAllTouchFeedback(false);
      },
      onCollaboratorLeft: () async {
        setDisableAllTouchFeedback(true);
        await presence.updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
      },
    );
    collaboratorTalkingStatusReactor();
    userTalkingStatusReactor();
    holdReactor();
    letGoReactor();
    widgets.wifiDisconnectOverlayReactor(
      onConnectionFinished: () async {
        await presence
            .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
      },
    );
    swipeReactor();
    desireToLeaveStatusReactor();
  }

  holdReactor() => reaction((p0) => hold.holdCount, (p0) async {
        ifTouchIsNotDisabled(() async {
          if (canSpeak &&
              voiceCall.voiceCallStatusStore.inCall == CallStatus.joined &&
              !widgets.isDisconnected &&
              presence.getSessionMetadataStore.collaboratorIsOnline) {
            await presence
                .updateWhoIsTalking(UpdateWhoIsTalkingParams.setUserAsTalker);
          }
        });
      });

  letGoReactor() => reaction((p0) => hold.letGoCount, (p0) async {
        if (canSpeak &&
            voiceCall.voiceCallStatusStore.inCall == CallStatus.joined &&
            !widgets.isDisconnected &&
            presence.getSessionMetadataStore.collaboratorIsOnline) {
          await presence.updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
          if (shouldIncrementSpeakerCount) {
            speakerCount++;
          }
        }
      });

  collaboratorTalkingStatusReactor() =>
      reaction((p0) => presence.getSessionMetadataStore.collaboratorIsTalking,
          (p0) {
        if (p0) {
          canSpeak = false;
        } else {
          if (speakerCount == 0 && !hasEvenSpeakerCounts) {}
          if (!shouldIncrementSpeakerCount) {
            speakerCount++;
          }
          canSpeak = true;
        }
      });

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) async {
        if (!hasSwipedUp &&
            canSwipeUp &&
            !widgets.isDisconnected &&
            presence.getSessionMetadataStore.collaboratorIsOnline) {
          hasSwipedUp = true;
          await logic
              .changeDesireToLeaveLogic(ChangeDesireToLeaveParams.affirmative);
          await presence.updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
          widgets.initWaitingWidgets(
            isReadyToExit: presence.getSessionMetadataStore.isAllowedToExit,
          );
          Timer(Seconds.get(5), () async {
            if (!isTransitioningHome) {
              hasSwipedUp = false;
              await logic
                  .changeDesireToLeaveLogic(ChangeDesireToLeaveParams.negative);
              widgets.revertWaitingWidgets();
            }
          });
        }
      });

  desireToLeaveStatusReactor() =>
      reaction((p0) => presence.getSessionMetadataStore.isAllowedToExit,
          (p0) async {
        if (p0) {
          await voiceCall.leaveCall();
          widgets.secondarySmartText.setWidgetVisibility(true);
          widgets.initTransitionToHome();
          isTransitioningHome = true;
        }
      });

  speakerCountReactor() => reaction((p0) => speakerCount, (p0) {
        if (shouldIncrementSpeakerCount) {
          widgets.showSecondaryText();
        } else {
          widgets.hideSecondaryText();
        }
      });

  userTalkingStatusReactor() =>
      reaction((p0) => presence.getSessionMetadataStore.userIsTalking,
          (p0) async {
        if (p0) {
          await voiceCall.unmute();
          widgets.onHold();
        } else {
          widgets.onLetGo();
          await voiceCall.mute();
        }
      });
}
