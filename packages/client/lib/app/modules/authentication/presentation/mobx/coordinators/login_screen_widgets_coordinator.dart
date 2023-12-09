// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
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
  final TrailingTextStore trailingText;

  _LoginScreenWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.smartTextStore,
    required this.nokhte,
    required this.trailingText,
  });

  constructor(Offset center) {
    setCenterScreenCoordinates(center);
    smartTextStore.setMessagesData(MessagesData.loginList);
    smartTextStore.startRotatingText();
    beachWaves.setMovieMode(BeachWaveMovieModes.blackOut);
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

  onResumed() => Future.delayed(Seconds.get(0, milli: 200), () {
        smartTextStore.startRotatingText();
      });

  onInactive() {
    smartTextStore.reset();
    nokhte.reset();
    if (!hasNotMadeTheDot) {
      toggleHasMadeTheDot();
    }
  }

  onTap(Offset currentTapPosition) {
    smartTextStore.startRotatingText(isResuming: true);
    toggleHasMadeTheDot();
    nokhte.setPositionMovie(
      currentTapPosition,
      centerScreenCoordinates,
    );
  }

  @override
  List<Object> get props => [];
}
