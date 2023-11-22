// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/solo_doc/domain/domain.dart';
import 'package:nokhte/app/core/modules/solo_doc/mobx/mobx.dart';
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
  final SmartFadingAnimatedTextTrackerStore fadingText;
  final SoloDocCoordinatorStore soloDoc;
  final SwipeDetector swipe;

  _P2PPurposePhase3CoordinatorStoreBase({
    required super.timer,
    required this.swipe,
    required super.beachWaves,
    required this.textEditor,
    required this.fadingText,
    required this.soloDoc,
  }) : super(productionTimerLength: const Duration(minutes: 5)) {
    reaction((p0) => beachWaves.movieStatus, (p0) async {
      if (beachWaves.movieStatus == MovieStatus.inProgress &&
          beachWaves.movieMode == BeachWaveMovieModes.timesUp) {
        delayedNavigation(() => beachWaves.teeUpBackToTheDepths());
        foregroundAndBackgroundStateListener();
        // beachWaves.backToTheDepthsCount++;
        textEditor.flipWidgetVisibility();
      } else if (beachWaves.movieStatus == MovieStatus.inProgress &&
          beachWaves.movieMode == BeachWaveMovieModes.backToTheDepths) {
        final currentText = textEditor.controller.text;
        await soloDoc
            .createSoloDoc(const CreateSoloDocParams(docType: 'purpose'));
        await soloDoc.submitSoloDoc(SubmitSoloDocParams(content: currentText));
        await soloDoc.shareSoloDoc(NoParams());
        delayedNavigation(
            () => Modular.to.navigate('/p2p_purpose_session/phase-4/'));
      }
    });
  }

  @action
  screenConstructor() async {
    fadingText.startRotatingText(Seconds.get(0));
    textEditor.flipWidgetVisibility();
    beachWaves.initiateSuspendedAtTheDepths();
    await timer.setupAndStreamListenerActivation(
        const CreateTimerParams(timerLengthInMinutes: 5), initOrPauseTimesUp);
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
