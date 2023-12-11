// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widget_constants.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
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

  constructor(Offset center, Function loginBusinessLogic) {
    setCenterScreenCoordinates(center);
    beachWaves.setMovieMode(BeachWaveMovieModes.blackOut);
    smartTextStore.setMessagesData(MessagesData.loginList);
    smartTextStore.startRotatingText();
    nokhteReactor(loginBusinessLogic);
    trailingTextReactor();
  }

  @observable
  bool hasNotMadeTheDot = true;

  @observable
  Offset centerScreenCoordinates = Offset.zero;

  @observable
  bool canSwipeUp = false;

  @action
  setCanSwipeUp(bool newBool) => canSwipeUp = newBool;

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
    setCanSwipeUp(false);
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
      nokhte.initPositionMovie(
        currentTapPosition,
        centerScreenCoordinates,
      );
    }
  }

  @action
  onSwipeUp() {
    if (canSwipeUp) {
      topTrailingText.initReverse();
      bottomTrailingText.initReverse();
    }
  }

  trailingTextReactor() =>
      reaction((p0) => bottomTrailingText.movieStatus, (p0) {
        if (bottomTrailingText.movieStatus == MovieStatus.finished &&
            bottomTrailingText.pastControl == Control.playReverseFromEnd) {
          nokhte.initMoveUpAndApparateMovie();
        }
      });

  nokhteReactor(Function loginBusinessLogic) =>
      reaction((p0) => nokhte.movieStatus, (p0) {
        if (p0 == MovieStatus.finished) {
          if (nokhte.movieMode == NokhteMovieModes.setPosition) {
            if (!bottomTrailingText.showWidget) {
              bottomTrailingText.toggleWidgetVisibility();
              topTrailingText.toggleWidgetVisibility();
            }
            bottomTrailingText.initMovie(NoParams());
            topTrailingText.initMovie(NoParams());
            setCanSwipeUp(true);
          } else if (nokhte.movieMode == NokhteMovieModes.moveUpAndApparate) {
            loginBusinessLogic();
          }
        }
      });

  @override
  List<Object> get props => [];
}
