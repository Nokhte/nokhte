// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/abort_purpose_session_artifacts/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/timer/domain/logic/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/mobx.dart';
part 'p2p_purpose_phase3_coordinator_store.g.dart';

class P2PPurposePhase3CoordinatorStore = _P2PPurposePhase3CoordinatorStoreBase
    with _$P2PPurposePhase3CoordinatorStore;

abstract class _P2PPurposePhase3CoordinatorStoreBase extends BaseTimesUpStore
    with Store {
  final SoloTextEditorTrackerStore textEditor;
  final AbortPurposeSessionArtifactsStore abortPurposeSessionArtifactsStore;
  final SmartFadingAnimatedTextTrackerStore fadingText;
  final SoloDocCoordinatorStore soloDoc;
  final SwipeDetector swipe;

  _P2PPurposePhase3CoordinatorStoreBase({
    required super.timer,
    required this.swipe,
    required super.beachWaves,
    required this.abortPurposeSessionArtifactsStore,
    required this.textEditor,
    required this.fadingText,
    required this.soloDoc,
  }) : super(productionTimerLength: const Duration(minutes: 5)) {
    reaction((p0) => beachWaves.movieStatus, (p0) async {
      print(" phase 3${beachWaves.movieStatus} ${beachWaves.movieMode}");
      if (beachWaves.movieMode == BeachWaveMovieModes.timesUp) {
        if (beachWaves.movieStatus == MovieStatus.finished) {
          textEditor.flipWidgetVisibility();
          beachWaves.teeUpBackToTheDepths();
          Future.delayed(Seconds.get(3), () async {
            await cleanUpAndTransition();
          });
        } else if (beachWaves.movieStatus == MovieStatus.inProgress) {
          delayedNavigation(() {
            textEditor.flipWidgetVisibility();
            beachWaves.teeUpBackToTheDepths();
            Future.delayed(Seconds.get(3), () async {
              await cleanUpAndTransition();
            });
          });
        }
      }
    });
  }

  cleanUpAndTransition() async {
    final currentText = textEditor.controller.text;
    await soloDoc.createSoloDoc(const CreateSoloDocParams(docType: 'purpose'));
    await soloDoc.submitSoloDoc(SubmitSoloDocParams(content: currentText));
    await soloDoc.shareSoloDoc(NoParams());
    Modular.to.navigate('/p2p_purpose_session/phase-4/');
    print("did it navigate to phase4");
  }

  @action
  screenConstructor() async {
    foregroundAndBackgroundStateListener();
    fadingText.startRotatingText(Seconds.get(0));
    textEditor.flipWidgetVisibility();
    beachWaves.initiateSuspendedAtTheDepths();
    await timer.setupAndStreamListenerActivation(
        const CreateTimerParams(timerLengthInMinutes: 5), initOrPauseTimesUp);
    await timer.setOnlineStatus(true);
    await timer.updateTimerRunningStatus(true);
    final timerLength =
        kDebugMode ? Seconds.get(20) : const Duration(minutes: 5);
    beachWaves.initiateTimesUp(timerLength: timerLength);
    fadingText.moveToNextMessage();
    Future.delayed(Seconds.get(1), () {
      fadingText.fadeTheTextIn();
    });
    Future.delayed(Seconds.get(3), () {
      fadingText.fadeTheTextOut();
      textEditor.flipWidgetVisibility();
    });
  }

  @override
  List<Object> get props => [];
}
