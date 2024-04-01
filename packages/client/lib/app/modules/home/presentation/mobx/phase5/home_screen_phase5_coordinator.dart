// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides, overridden_fields
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/shared/base_home_screen_coordinator.dart';
import 'package:nokhte/app/modules/storage/domain/domain.dart';
import 'home_screen_phase5_widgets_coordinator.dart';
part 'home_screen_phase5_coordinator.g.dart';

class HomeScreenPhase5Coordinator = _HomeScreenPhase5CoordinatorBase
    with _$HomeScreenPhase5Coordinator;

abstract class _HomeScreenPhase5CoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final HomeScreenPhase5WidgetsCoordinator widgets;
  final GetNokhteSessionArtifacts getNokhteSessionArtifactsLogic;

  _HomeScreenPhase5CoordinatorBase({
    required super.collaborationLogic,
    required super.swipe,
    required super.deepLinks,
    required this.widgets,
    required this.getNokhteSessionArtifactsLogic,
    required super.captureScreen,
    required super.tap,
  }) : super(widgets: widgets);

  @observable
  ObservableList<NokhteSessionArtifactEntity> nokhteSessionArtifacts =
      ObservableList();

  @override
  @action
  constructor(Offset offset) async {
    widgets.constructor(offset);
    initReactors();
    await captureScreen(Screens.homePhase5);
    await getNokhteSessionArtifacts();
  }

  @override
  initReactors() {
    super.initReactors();
    swipeReactor(
      onSwipeUp: widgets.onSwipeUp,
      onSwipeRight: () => widgets.onSwipeRight(),
    );
    widgets.beachWavesMovieStatusReactor(
      onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
      onShoreToVibrantBlueComplete: onShoreToVibrantBlueComplete,
      onVirginStorageEntry: () {},
      onAnyToShoreComplete: () {
        setDisableAllTouchFeedback(false);
      },
      onSubsequentStorageEntry: onSubsequentStorageEntry,
    );
  }

  @action
  getNokhteSessionArtifacts() async {
    final res = await getNokhteSessionArtifactsLogic(NoParams());
    res.fold(
      (failure) => errorUpdater(failure),
      (artifacts) => nokhteSessionArtifacts = ObservableList.of(artifacts),
    );
  }

  @action
  onSubsequentStorageEntry() {
    Timer.periodic(Seconds.get(0, milli: 100), (timer) {
      if (widgets.touchRipple.movieStatus == MovieStatus.finished) {
        Modular.to.navigate('/storage/');
        timer.cancel();
      }
    });
  }
}
