// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/domain/logic/change_desire_to_leave.dart';
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/presentation/mobx/coordinators/coordinators.dart';
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/types/types.dart';
import 'package:permission_handler/permission_handler.dart';
part 'legacy_virtual_nokhte_session_phase1_coordinator.g.dart';

class LegacyVirtualNokhteSessionPhase1Coordinator = _LegacyVirtualNokhteSessionPhase1CoordinatorBase
    with _$LegacyVirtualNokhteSessionPhase1Coordinator;

abstract class _LegacyVirtualNokhteSessionPhase1CoordinatorBase
    extends BaseCoordinator with Store {
  final LegacyVirtualNokhteSessionPhase1WidgetsCoordinator widgets;
  final IrlNokhteSessionPresenceCoordinator presence;
  final VoiceCallCoordinator voiceCall;
  final HoldDetector hold;
  final SwipeDetector swipe;
  final LegacyVirtualNokhteSessionLogicCoordinator logic;

  _LegacyVirtualNokhteSessionPhase1CoordinatorBase({
    required this.widgets,
    required this.presence,
    required this.voiceCall,
    required this.hold,
    required this.swipe,
    required this.logic,
    required super.captureScreen,
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
  SpeakerIndexType speakerIndexType = SpeakerIndexType.initial;

  @computed
  bool get speakerCountIsOdd => speakerCount % 2 == 1;

  @computed
  bool get speakerCountIsEven => speakerCount % 2 == 0;

  @computed
  bool get hasEvenSpeakerCounts => speakerIndexType == SpeakerIndexType.even;

  @computed
  bool get shouldIncrementSpeakerCount =>
      speakerIndexType == SpeakerIndexType.even
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

    await logic.changeDesireToLeaveLogic(ChangeDesireToLeaveParams.negative);
    await captureScreen(Screens.nokhteSessionPhase1);
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
      if (logic.hasTheQuestion) {
        speakerIndexType = SpeakerIndexType.even;
        widgets.showSecondaryText();
        canSpeak = true;
      } else {
        speakerIndexType = SpeakerIndexType.odd;
        canSpeak = true;
      }
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
          await presence.updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
          await voiceCall.leaveCall();
          widgets.initTransitionToWaiting();
        }
      });

  desireToLeaveStatusReactor() => null;
  // reaction((p0) => presence.getSessionMetadataStore.isAllowedToExit,
  //     (p0) async {
  //   if (p0) {
  //     await voiceCall.leaveCall();
  //     widgets.secondarySmartText.setWidgetVisibility(true);
  //     widgets.initTransitionToHome();
  //     isTransitioningHome = true;
  //   }
  // });

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
