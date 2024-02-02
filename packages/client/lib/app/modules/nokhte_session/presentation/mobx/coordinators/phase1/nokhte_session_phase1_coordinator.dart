// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/logic/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
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
  int speakerCount = 0;

  @observable
  Stopwatch silenceStopwatch = Stopwatch();

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
    await Permission.microphone.request();
    await voiceCall.joinCall(
      shouldEnterTheCallMuted: true,
      callType: GetChannelIdParams.forNokhteSession,
    );
    initReactors();
    await presence.listen();
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    await logic.checkIfUserHasTheQuestion();
    widgets.setHasTheQuesion(logic.hasTheQuestion);
    if (logic.hasTheQuestion) {
      questionIndexType = QuestionIndexType.even;
      widgets.hasTheQuestionConstructor();
      canSpeak = true;
    } else {
      questionIndexType = QuestionIndexType.odd;
      widgets.doesNotHaveTheQuestionConstructor();
    }
  }

  @action
  onInactive() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userNegative());
    await presence.updateWhoIsTalking(UpdateWhoIsTalkingParams.clearOut);
    silenceStopwatch.reset();
    silenceStopwatch.stop();
    print("STOP + RESET");
  }

  @action
  onResumed() async {
    await presence
        .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
    if (presence.getSessionMetadataStore.collaboratorIsOnline) {
      presence.incidentsOverlayStore.onCollaboratorJoined();
    }
    if (!widgets.isDisconnected) {
      if (speakerCount.isGreaterThan(0)) {
        silenceStopwatch.start();
        print("START AGAIN");
      }
    }
  }

  initReactors() {
    speakerCountReactor();
    voiceCall.initReactors(onBothJoinedCall: () {
      setDisableAllTouchFeedback(false);
    });
    presence.initReactors(
      onCollaboratorJoined: () {
        if (speakerCount.isGreaterThan(0)) {
          silenceStopwatch.start();
          print("START AGAIN");
        }
        setDisableAllTouchFeedback(false);
      },
      onCollaboratorLeft: () async {
        silenceStopwatch.reset();
        silenceStopwatch.stop();
        print("STOP + RESET");
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
        if (speakerCount.isGreaterThan(0)) {
          silenceStopwatch.start();
          print("START AGAIN WIFI DISCONNECT");
        }
        // ok bug don't foget the person who disconnects doesn't get their
        // stopwatch running for some reason figure this out when you get back
        await presence
            .updateOnlineStatus(UpdatePresencePropertyParams.userAffirmative());
      },
    );
  }

  holdReactor() => reaction((p0) => hold.holdCount, (p0) async {
        ifTouchIsNotDisabled(() async {
          if (canSpeak &&
              voiceCall.voiceCallStatusStore.inCall == CallStatus.joined &&
              !widgets.isDisconnected &&
              presence.getSessionMetadataStore.collaboratorIsOnline) {
            // if (speakerCount != 0) {
            silenceStopwatch.reset();
            silenceStopwatch.stop();
            print("RESET * STOPPED");
            // }

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
          silenceStopwatch.start();
          print("started");
          if (shouldIncrementSpeakerCount) {
            speakerCount++;
            if (speakerCount == 3 && hasEvenSpeakerCounts) {
              widgets.primarySmartText.startRotatingText(isResuming: true);
            }
          }
        }
      });

  collaboratorTalkingStatusReactor() =>
      reaction((p0) => presence.getSessionMetadataStore.collaboratorIsTalking,
          (p0) {
        if (speakerCount == 0 && !hasEvenSpeakerCounts) {
          widgets.primarySmartText.startRotatingText(isResuming: true);
        }
        if (p0) {
          canSpeak = false;
          silenceStopwatch.reset();
          silenceStopwatch.stop();
          print("RESET & STOP");
        } else {
          silenceStopwatch.start();
          if (speakerCount == 0 && !hasEvenSpeakerCounts) {
            print("STARTED");
            Timer.periodic(Seconds.get(9), (timer) {
              if (silenceStopwatch.elapsedMilliseconds.isGreaterThan(9000)) {
                print("9 SECOND SILENCE REACHED");
                widgets.primarySmartText.startRotatingText(isResuming: true);
                timer.cancel();
              }
            });
          }
          if (!shouldIncrementSpeakerCount) {
            speakerCount++;
          }
          canSpeak = true;
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
          await voiceCall.voiceCallActionsStore.unmuteAudio(NoParams());
          widgets.onHold();
        } else {
          widgets.onLetGo();
          await voiceCall.voiceCallActionsStore.muteAudio(NoParams());
        }
      });
}
