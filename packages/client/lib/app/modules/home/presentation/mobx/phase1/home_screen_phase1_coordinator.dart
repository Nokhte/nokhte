// ignore_for_file: must_be_immutable, library_private_types_in_public_api, overridden_fields, annotate_overrides
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
part 'home_screen_phase1_coordinator.g.dart';

class HomeScreenPhase1Coordinator = _HomeScreenPhase1CoordinatorBase
    with _$HomeScreenPhase1Coordinator;

abstract class _HomeScreenPhase1CoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final HomeScreenPhase1WidgetsCoordinator widgets;
  _HomeScreenPhase1CoordinatorBase({
    required super.collaborationLogic,
    required super.swipe,
    required this.widgets,
    required super.deepLinks,
    required super.captureScreen,
    required super.tap,
  }) : super(widgets: widgets);

  @override
  @action
  constructor(center) async {
    widgets.constructor(center);
    initReactors();
    await captureScreen(Screens.homePhase1);
  }

  @override
  initReactors() {
    super.initReactors();
    swipeReactor(
      onSwipeUp: () {
        widgets.onSwipeUp();
      },
      onSwipeRight: () {},
    );
    swipeCoordinatesReactor(onSwipeUpCordinatesChanged);
    widgets.beachWavesMovieStatusReactor(
        onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
        onShoreToVibrantBlueComplete: onShoreToVibrantBlueComplete,
        onVirginStorageEntry: () {},
        onSubsequentStorageEntry: () {},
        onAnyToShoreComplete: () {
          setDisableAllTouchFeedback(false);
        });
  }

  onSwipeUpCordinatesChanged(Offset offset) {
    if (widgets.primarySmartText.currentIndex == 3 ||
        widgets.primarySmartText.currentIndex == 5) {
      widgets.onSwipeCoordinatesChanged(offset);
    }
  }

  tapReactor() => reaction((p0) => tap.currentTapPosition, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onTap(p0);
        });
      });
}
