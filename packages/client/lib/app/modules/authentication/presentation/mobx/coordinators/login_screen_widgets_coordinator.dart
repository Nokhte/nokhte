// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'login_screen_widgets_coordinator.g.dart';

class LoginScreenWidgetsCoordinator = _LoginScreenWidgetsCoordinatorBase
    with _$LoginScreenWidgetsCoordinator;

abstract class _LoginScreenWidgetsCoordinatorBase extends Equatable with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore smartTextStore;
  final NokhteStore nokhte;
  final TrailingTextStore bottomTrailingText;
  final TrailingTextStore topTrailingText;

  _LoginScreenWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.smartTextStore,
    required this.nokhte,
    required this.bottomTrailingText,
    required this.topTrailingText,
  });

  constructor(Offset center) {
    setCenterScreenCoordinates(center);
    beachWaves.setMovieMode(BeachWaveMovieModes.blackOut);
    smartTextStore.setMessagesData(MessagesData.loginList);
    smartTextStore.startRotatingText();
    onNokhteCompletedReactor();
  }

  @observable
  bool hasNotMadeTheDot = true;

  @observable
  Offset centerScreenCoordinates = Offset.zero;

  @action
  toggleHasMadeTheDot() => hasNotMadeTheDot = !hasNotMadeTheDot;

  @action
  setCenterScreenCoordinates(Offset newCoordinates) =>
      centerScreenCoordinates = newCoordinates;

  @action
  onResumed() {
    if (bottomTrailingText.showWidget) {
      bottomTrailingText.reset();
      topTrailingText.reset();
    }
    Future.delayed(Seconds.get(0, milli: 200), () {
      smartTextStore.startRotatingText();
    });
  }

  @action
  onInactive() {
    smartTextStore.reset();
    nokhte.reset();
    if (!hasNotMadeTheDot) {
      toggleHasMadeTheDot();
    }
  }

  @action
  onTap(Offset currentTapPosition) {
    if (Gestures.tap == smartTextStore.currentUnlockGesture &&
        hasNotMadeTheDot) {
      smartTextStore.startRotatingText(isResuming: true);
      toggleHasMadeTheDot();
      nokhte.setPositionMovie(
        currentTapPosition,
        centerScreenCoordinates,
      );
    }
  }

  @action
  onSwipeUp() {
    topTrailingText.initReverse();
    bottomTrailingText.initReverse();
  }

  // make a

  onNokhteCompletedReactor() => reaction((p0) => nokhte.movieStatus, (p0) {
        // we will need to add movie movies here
        if (p0 == MovieStatus.finished) {
          if (!bottomTrailingText.showWidget) {
            bottomTrailingText.toggleWidgetVisibility();
            topTrailingText.toggleWidgetVisibility();
          }
          bottomTrailingText.initMovie(NoParams());
          topTrailingText.initMovie(NoParams());
        }
      });

  @override
  List<Object> get props => [];
}
