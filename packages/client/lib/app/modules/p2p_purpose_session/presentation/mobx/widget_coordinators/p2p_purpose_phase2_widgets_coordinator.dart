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

  @observable
  bool isFirstTimeTalking = true;

  @action
  constructor({required String mainOnScreenMessage}) async {
    await setFadingTextMessageAndFadeIn(
      mainOnScreenMessage: mainOnScreenMessage,
    );
    newBeachWaves.setMovieMode(BeachWaveMovieModes.timesUp);
    explanationText.widgetConstructor(message: "hold to talk");
    meshCircleStore.widgetConstructor();
  }

  setFadingTextMessageAndFadeIn({required String mainOnScreenMessage}) async {
    fadingText.startRotatingText(Seconds.get(0));
    fadingText.setMainMessage(
      index: 1,
      thePhrase: mainOnScreenMessage,
    );
    await fadingText
        .oneSecondDelay(() async => await fadingText.fadeTheTextIn());
    Future.delayed(Seconds.get(1), () {
      fadingText.togglePause();
    });
  }

  @action
  disableMeshAndMirrorCollaboratorsGlow() {
    print("is this running disableAndMirror????");
    meshCircleStore.toggleIsEnabled();
    meshCircleStore.initGlowUp();
  }

  @action
  enableMeshAfterCooldownPeriod() => Future.delayed(
        Seconds.get(1),
        () {
          meshCircleStore.toggleIsEnabled();
          meshCircleStore.initGlowDown();
        },
      );

  @action
  audioButtonHoldStartCallback({
    required Function firstTimeTalkingCallback,
    required Function everyTimeCallback,
  }) async {
    if (meshCircleStore.isEnabled) {
      if (isFirstTimeTalking) {
        isFirstTimeTalking = false;
        Future.delayed(
          Seconds.get(3),
          () => explanationText.toggleWidgetVisibility(),
        );
        await firstTimeTalkingCallback();
      }
      meshCircleStore.initGlowUp();

      if (fadingText.currentIndex == 1 && fadingText.showText) {
        Future.delayed(Seconds.get(10), () => fadingText.fadeTheTextOut());
      }
      await everyTimeCallback();
      meshCircleStore.toggleColorAnimation();
    }
  }

  audioButtonHoldEndCallback({
    required Function ifMeshIsEnabledCallback,
  }) async {
    if (meshCircleStore.isEnabled) {
      await ifMeshIsEnabledCallback();
      meshCircleStore.initGlowDown();
      meshCircleStore.toggleColorAnimation();
    }
  }

  @action
  uiCleanUp() {
    explanationText.toggleWidgetVisibility();
    if (fadingText.showText) {
      fadingText.fadeTheTextOut();
    }
    if (explanationText.showWidget) {
      explanationText.toggleWidgetVisibility();
    }
    meshCircleStore.toggleWidgetVisibility();
    // Modular.to.navigate('/p2p_purpose_session/phase-3/');
  }

  beachWavesMovieStatusWatcher({required Function logicRelatedCallback}) =>
      reaction((p0) => newBeachWaves.movieStatus, (p0) async {
        if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode == BeachWaveMovieModes.timesUp) {
          newBeachWaves.setMovieMode(BeachWaveMovieModes.timesUpEndToTheDepths);
          newBeachWaves.currentStore.initMovie(NoParams());
          await logicRelatedCallback();
          await uiCleanUp();
        } else if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode ==
                BeachWaveMovieModes.timesUpEndToTheDepths) {
          Modular.to.navigate('/p2p_purpose_session/phase-3/');
        }
      });

  @override
  List<Object> get props => [
// some items
      ];
}
