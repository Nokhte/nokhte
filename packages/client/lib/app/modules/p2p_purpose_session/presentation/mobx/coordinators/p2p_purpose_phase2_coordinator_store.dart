// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'p2p_purpose_phase2_coordinator_store.g.dart';

class P2PPurposePhase2CoordinatorStore = _P2PPurposePhase2CoordinatorStoreBase
    with _$P2PPurposePhase2CoordinatorStore;

abstract class _P2PPurposePhase2CoordinatorStoreBase extends Equatable
    with Store {
  final AgoraCallbacksStore agoraCallbacksStore;
  final VoiceCallActionsStore voiceCallActionsStore;
  final CheckIfUserHasTheQuestionStore questionCheckerStore;
  final BeachWavesTrackerStore beachWaves;
  final SmartFadingAnimatedTextTrackerStore fadingText;
  final MeshCircleButtonStore meshCircleStore;
  final SwipeDetector swipe;
  final HoldDetector hold;

  @observable
  bool isFirstTimeTalking = true;

  @action
  screenConstructor() async {
    beachWaves.initiateSuspendedAtTheDepths();
    holdStartListener();
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

  _P2PPurposePhase2CoordinatorStoreBase({
    required this.swipe,
    required this.hold,
    required this.agoraCallbacksStore,
    required this.questionCheckerStore,
    required this.voiceCallActionsStore,
    required this.beachWaves,
    required this.fadingText,
    required this.meshCircleStore,
  }) {
    reaction((p0) => beachWaves.movieMode, (p0) {
      if (beachWaves.movieMode == BeachWaveMovieModes.backToTheDepthsSetup) {
        meshCircleStore.toggleWidgetVisibility();
      }
    });
    reaction((p0) => beachWaves.movieStatus, (p0) {
      if (beachWaves.movieStatus == MovieStatus.finished &&
          beachWaves.movieMode == BeachWaveMovieModes.timesUp) {
        beachWaves.teeUpBackToTheDepths();
        beachWaves.backToTheDepthsCount++;
      } else if (beachWaves.movieStatus == MovieStatus.finished &&
          beachWaves.movieMode == BeachWaveMovieModes.backToTheDepths) {
        Modular.to.navigate('/p2p_purpose_session/phase-3/');
      }
    });
  }

  holdStartListener() => reaction((p0) => hold.holdCount, (p0) {
        audioButtonHoldStartCallback();
      });

  holdEndListener() => reaction((p0) => hold.letGoCount, (p0) {
        audioButtonHoldEndCallback();
      });

  @action
  audioButtonHoldStartCallback() {
    if (isFirstTimeTalking) {
      beachWaves.initiateTimesUp(
        timerLength: const Duration(
          minutes: 5,
        ),
      );
      fadingText.fadeTheTextOut();
      isFirstTimeTalking = false;
    }

    ///// TODO comment out for production
    voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: false);
    meshCircleStore.toggleColorAnimation();
  }

  @action
  audioButtonHoldEndCallback() {
    voiceCallActionsStore.muteOrUnmuteAudio(wantToMute: true);
    meshCircleStore.toggleColorAnimation();
  }

  @override
  List<Object> get props => [];
}
