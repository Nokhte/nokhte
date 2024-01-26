// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_times_up_store.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase4_widgets_coordinator.g.dart';

class P2PPurposePhase4WidgetsCoordinator = _P2PPurposePhase4WidgetsCoordinatorBase
    with _$P2PPurposePhase4WidgetsCoordinator;

abstract class _P2PPurposePhase4WidgetsCoordinatorBase extends BaseTimesUpStore
    with Store {
  final SmartFadingAnimatedTextTrackerStore fadingText;
  _P2PPurposePhase4WidgetsCoordinatorBase({
    required super.newBeachWaves,
    required this.fadingText,
  }) : super(productionTimerLength: const Duration(minutes: 5));

  @action
  constructor({required String collaboratorsDocContent}) {
    newBeachWaves.setMovieMode(BeachWaveMovieModes.suspendedAtTheDepths);
    newBeachWaves.currentStore.initMovie(NoParams());
    fadingText.startRotatingText(Seconds.get(0));
    fadingText.moveToNextMessage();
    fadingText.fadeTheTextIn();
    fadingText.setMainMessage(index: 4, thePhrase: collaboratorsDocContent);
  }

  beachWavesMovieStatusWatcher({required Function onTimesUpComplete}) =>
      reaction((p0) => newBeachWaves.movieStatus, (p0) async {
        if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode ==
                BeachWaveMovieModes.suspendedAtTheDepths) {
          newBeachWaves.setMovieMode(BeachWaveMovieModes.timesUp);
        } else if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode == BeachWaveMovieModes.timesUp) {
          newBeachWaves.setMovieMode(BeachWaveMovieModes.timesUpEndToTheDepths);
          newBeachWaves.currentStore.initMovie(NoParams());
          await onTimesUpComplete();
          await uiCleanUpAndTransition();
        } else if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode ==
                BeachWaveMovieModes.timesUpEndToTheDepths) {
          Modular.to.navigate('/p2p_purpose_session/phase-5/');
        }
      });

  @action
  uiCleanUpAndTransition() => fadingText.fadeTheTextOut();
}
