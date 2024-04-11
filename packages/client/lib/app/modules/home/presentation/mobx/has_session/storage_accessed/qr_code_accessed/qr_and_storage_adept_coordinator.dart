// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides, overridden_fields
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/shared/base_home_screen_coordinator.dart';
import 'package:nokhte/app/modules/storage/domain/domain.dart';
import 'qr_and_storage_adept_widgets_coordinator.dart';
part 'qr_and_storage_adept_coordinator.g.dart';

class QrAndStorageAdeptCoordinator = _QrAndStorageAdeptCoordinatorBase
    with _$QrAndStorageAdeptCoordinator;

abstract class _QrAndStorageAdeptCoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final QrAndStorageAdeptWidgetsCoordinator widgets;
  final GetNokhteSessionArtifacts getNokhteSessionArtifactsLogic;

  _QrAndStorageAdeptCoordinatorBase({
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
    await captureScreen(Screens.qrAndStorageAdeptHome);
    await getNokhteSessionArtifacts();
  }

  @override
  initReactors() {
    super.initReactors();
    swipeReactor(
      onSwipeUp: () => widgets.onSwipeUp(),
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
    swipeCoordinatesReactor(widgets.onSwipeCoordinatesChanged);
    tapReactor();
  }

  tapReactor() => reaction((p0) => tap.currentTapPosition, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onTap(p0);
        });
      });

  @action
  getNokhteSessionArtifacts() async {
    final res = await getNokhteSessionArtifactsLogic(NoParams());
    res.fold(
      (failure) => errorUpdater(failure),
      (artifacts) => nokhteSessionArtifacts = ObservableList.of(artifacts),
    );
  }
}
