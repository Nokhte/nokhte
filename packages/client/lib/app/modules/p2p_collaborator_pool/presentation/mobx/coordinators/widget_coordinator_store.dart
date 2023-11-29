// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/types/types.dart';
import 'package:nokhte/app/core/widgets/smart_fading_animated_text/stack/constants/constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'widget_coordinator_store.g.dart';

class WidgetCoordinatorStore = _WidgetCoordinatorStoreBase
    with _$WidgetCoordinatorStore;

abstract class _WidgetCoordinatorStoreBase extends Equatable with Store {
  final MeshCircleButtonStore meshCircleButtonStore;
  final FadeInAndChangeColorTextStore fadeInAndChangeColorTextStore;
  final SmartFadingAnimatedTextTrackerStore fadingText;
  final NewBeachWavesStore newBeachWaves;
  final BeachWavesTrackerStore beachWavesStore;
  final ExplanationTextStore explanationText;

  _WidgetCoordinatorStoreBase({
    required this.meshCircleButtonStore,
    required this.newBeachWaves,
    required this.fadingText,
    required this.beachWavesStore,
    required this.fadeInAndChangeColorTextStore,
    required this.explanationText,
  });

  @observable
  bool isFirstTime = true;

  @action
  toggleIsFirstTime() => isFirstTime = !isFirstTime;

  @action
  widgetConstructor() {
    if (isFirstTime) {
      fadingText.setMessagesData(MessagesData.speakTheCollaboratorPhraseList);
      fadingText.startRotatingText(Seconds.get(0));
      toggleIsFirstTime();
    }
    // explanationText.widgetConstructor();
    explanationText.widgetConstructor(message: "hold to talk");
    meshCircleButtonStore.widgetConstructor();
    beachWavesStore.initiateSuspendedAtSea();
    if (!fadingText.showText && !fadingText.firstTime) {
      fadingText.resetToDefault();
    }
  }

  @action
  fadeOutExplanationTextIfNecessary() {
    if (explanationText.showWidget) {
      explanationText.toggleWidgetVisibility();
    }
  }

  @action
  backToShoreWidgetChanges() {
    if (beachWavesStore.movieStatus != MovieStatus.inProgress &&
        beachWavesStore.movieMode == BeachWaveMovieModes.suspendedAtSea) {
      beachWavesStore.initiateBackToShore();
      fadeOutExplanationTextIfNecessary();
      fadingText.fadeTheTextOut();
      meshCircleButtonStore.toggleWidgetVisibility();
    }
  }

  @action
  toTheDepthsWidgetChanges() {
    if (beachWavesStore.movieStatus != MovieStatus.inProgress &&
        beachWavesStore.movieMode == BeachWaveMovieModes.suspendedAtSea) {
      beachWavesStore.initiateToTheDepths();
      fadingText.fadeTheTextOut();
      fadeOutExplanationTextIfNecessary();
      meshCircleButtonStore.toggleWidgetVisibility();
    }
  }

  @override
  List<Object> get props => [];
}
