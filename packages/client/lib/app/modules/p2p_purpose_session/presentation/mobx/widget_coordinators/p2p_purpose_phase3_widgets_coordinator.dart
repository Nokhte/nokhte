// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase3_widgets_coordinator.g.dart';

class P2PPurposePhase3WidgetsCoordinator = _P2PPurposePhase3WidgetsCoordinatorBase
    with _$P2PPurposePhase3WidgetsCoordinator;

abstract class _P2PPurposePhase3WidgetsCoordinatorBase extends BaseTimesUpStore
    with Store {
  final SoloTextEditorTrackerStore textEditor;
  final SmartFadingAnimatedTextTrackerStore fadingText;

  _P2PPurposePhase3WidgetsCoordinatorBase({
    required super.newBeachWaves,
    required this.textEditor,
    required this.fadingText,
  }) : super(productionTimerLength: const Duration(minutes: 5));

  uiCleanUpAndTransition() {
    textEditor.flipWidgetVisibility();
    Modular.to.navigate('/p2p_purpose_session/phase-4/');
  }

  @action
  constructor() {
    fadingText.startRotatingText(Seconds.get(0));
    textEditor.flipWidgetVisibility();
    newBeachWaves.setMovieMode(BeachWaveMovieModes.timesUp);
    fadingText.moveToNextMessage();
    Future.delayed(Seconds.get(1), () {
      fadingText.fadeTheTextIn();
    });
    Future.delayed(Seconds.get(3), () {
      fadingText.fadeTheTextOut();
      textEditor.flipWidgetVisibility();
    });
  }

  beachWavesMovieStatusWatcher({required Function onTimesUpComplete}) =>
      reaction((p0) => newBeachWaves.movieStatus, (p0) async {
        print("did this run?? $p0 ${newBeachWaves.movieMode}");
        if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode == BeachWaveMovieModes.timesUp) {
          print("does this run on instantiation??");
          // newBeachWaves.setMovieMode(BeachWaveMovieModes.timesUpEndToTheDepths);
          // newBeachWaves.currentStore.initMovie(NoParams());
          await onTimesUpComplete();
          await uiCleanUpAndTransition();
        }
      });
}
