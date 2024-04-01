// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
part 'home_screen_phase3_widgets_coordinator.g.dart';

class HomeScreenPhase3WidgetsCoordinator = _HomeScreenPhase3WidgetsCoordinatorBase
    with _$HomeScreenPhase3WidgetsCoordinator;

abstract class _HomeScreenPhase3WidgetsCoordinatorBase
    extends BaseHomeScreenWidgetsCoordinator with Store {
  _HomeScreenPhase3WidgetsCoordinatorBase({
    required super.nokhteBlur,
    required super.beachWaves,
    required super.wifiDisconnectOverlay,
    required super.gestureCross,
    required super.primarySmartText,
    required super.errorSmartText,
    required super.secondaryErrorSmartText,
    required super.touchRipple,
  });

  @observable
  bool gracePeriodHasExpired = false;

  @action
  toggleGracePeriodHasExpired() =>
      gracePeriodHasExpired = !gracePeriodHasExpired;

  @override
  @action
  constructor(Offset offset) {
    super.constructor(offset);
    primarySmartText.setMessagesData(MessagesData.homeListHasDoneASession);
    primarySmartText.startRotatingText();
    initReactors();
  }

  @action
  @override
  initReactors() {
    super.initReactors();
  }

  @action
  onSwipeUp() => prepForNavigation(excludeUnBlur: !hasInitiatedBlur);

  @action
  onSwipeRight() {
    beachWaves.setMovieMode(BeachWaveMovieModes.onShoreToDrySand);
    beachWaves.currentStore.initMovie(
      beachWaves.currentAnimationValues.first,
    );
    gestureCross.initMoveAndRegenerate(CircleOffsets.right);
    gestureCross.cross.initOutlineFadeIn();
    primarySmartText.setWidgetVisibility(false);
  }
}
