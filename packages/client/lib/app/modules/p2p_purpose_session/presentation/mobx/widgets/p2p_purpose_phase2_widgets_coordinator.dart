// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
// * Mobx Codegen Inclusion
part 'p2p_purpose_phase2_widgets_coordinator.g.dart';

class P2PPurposePhase2WidgetsCoordinator = _P2PPurposePhase2WidgetsCoordinatorBase
    with _$P2PPurposePhase2WidgetsCoordinator;

abstract class _P2PPurposePhase2WidgetsCoordinatorBase extends BaseTimesUpStore
    with Store {
  final ExplanationTextStore explanationText;
  final SmartFadingAnimatedTextTrackerStore fadingText;
  final MeshCircleButtonStore meshCircleStore;

  _P2PPurposePhase2WidgetsCoordinatorBase({
    required super.newBeachWaves,
    required this.explanationText,
    required this.fadingText,
    required this.meshCircleStore,
  }) : super(productionTimerLength: const Duration(minutes: 5));

  @action
  constructor({required String mainOnScreenMessage}) async {
    fadingText.startRotatingText(Seconds.get(0));
    explanationText.widgetConstructor(message: "hold to talk");
    meshCircleStore.widgetConstructor();
    await fadingText
        .oneSecondDelay(() async => await fadingText.fadeTheTextIn());
    fadingText
        .setMainMessage(
          index: 1,
          thePhrase: mainOnScreenMessage,
        )
        .then((value) => Future.delayed(Seconds.get(1), () {
              fadingText.togglePause();
            }));
  }

  @action
  disableAndMirrorCollaboratorsGlow() {
    meshCircleStore.toggleIsEnabled();
    meshCircleStore.initGlowUp();
  }

  @action
  enableAfterCooldownPeriod() => Future.delayed(
        Seconds.get(1),
        () {
          meshCircleStore.toggleIsEnabled();
          meshCircleStore.initGlowDown();
        },
      );

  @action
  uiCleanUpAndTransition() {
    explanationText.toggleWidgetVisibility();
    if (fadingText.showText) {
      fadingText.fadeTheTextOut();
    }
    if (explanationText.showWidget) {
      explanationText.toggleWidgetVisibility();
    }
    meshCircleStore.toggleWidgetVisibility();
    Modular.to.navigate('/p2p_purpose_session/phase-3/');
  }

  beachWavesMovieStatusWatcher(Function logicRelatedCallback) =>
      reaction((p0) => newBeachWaves.movieStatus, (p0) async {
        if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode == BeachWaveMovieModes.timesUp) {
          newBeachWaves.setMovieMode(BeachWaveMovieModes.timesUpEndToTheDepths);
          newBeachWaves.currentStore.initMovie(NoParams());
          await logicRelatedCallback();
          await uiCleanUpAndTransition();
        }
      });

  @override
  List<Object> get props => [
// some items
      ];
}
