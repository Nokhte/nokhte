// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides, overridden_fields
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/posthog.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'qr_and_storage_adept_coordinator.g.dart';

class QrAndStorageAdeptCoordinator = _QrAndStorageAdeptCoordinatorBase
    with _$QrAndStorageAdeptCoordinator;

abstract class _QrAndStorageAdeptCoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  @override
  final CaptureScreen captureScreen;
  final QrAndStorageAdeptWidgetsCoordinator widgets;
  final GetNokhteSessionArtifacts getNokhteSessionArtifactsLogic;

  _QrAndStorageAdeptCoordinatorBase({
    required super.sessionStarters,
    required super.swipe,
    required super.deepLinks,
    required this.widgets,
    required this.getNokhteSessionArtifactsLogic,
    required this.captureScreen,
    required super.tap,
  }) : super(
          widgets: widgets,
          captureScreen: captureScreen,
        );

  @observable
  ObservableList<NokhteSessionArtifactEntity> nokhteSessionArtifacts =
      ObservableList();

  @override
  @action
  constructor(Offset offset) async {
    widgets.constructor(offset);
    initReactors();
    await captureScreen(HomeConstants.qrAndStorageAdept);
    await getNokhteSessionArtifacts();
  }

  @override
  initReactors() {
    super.initReactors();
    disposers.add(swipeReactor(
      onSwipeUp: () => widgets.onSwipeUp(),
      onSwipeRight: () => widgets.onSwipeRight(),
    ));
    disposers.add(widgets.beachWavesMovieStatusReactor(
      onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
      onShoreToDeepSeaComplete: onShoreToDeepSeaComplete,
      onAnyToShoreComplete: () {
        setDisableAllTouchFeedback(false);
      },
      onStorageEntry: onSubsequentStorageEntry,
    ));
    disposers.add(swipeCoordinatesReactor(widgets.onSwipeCoordinatesChanged));
    disposers.add(tapReactor());
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        if (isInErrorMode) {
          widgets.onErrorResolved(() {
            setIsInErrorMode(true);
          });
        }
        ifTouchIsNotDisabled(() {
          widgets.onTap(tap.currentTapPosition);
        });
      });

  @action
  getNokhteSessionArtifacts() async {
    final res = await getNokhteSessionArtifactsLogic(NoParams());
    res.fold(
      (failure) => baseErrorUpdater(failure),
      (artifacts) => nokhteSessionArtifacts = ObservableList.of(artifacts),
    );
  }
}
