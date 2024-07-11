// ignore_for_file: must_be_immutable, library_private_types_in_public_api,  overridden_fields
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
import 'package:nokhte/app/modules/home/home.dart';
part 'qr_and_storage_adept_coordinator.g.dart';

class QrAndStorageAdeptCoordinator = _QrAndStorageAdeptCoordinatorBase
    with _$QrAndStorageAdeptCoordinator;

abstract class _QrAndStorageAdeptCoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final GetNokhteSessionArtifacts getNokhteSessionArtifactsLogic;
  @override
  final QrAndStorageAdeptWidgetsCoordinator widgets;

  _QrAndStorageAdeptCoordinatorBase({
    required super.sessionStarters,
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
    await captureScreen(HomeConstants.qrAndStorageAdept);
    await getNokhteSessionArtifacts();
  }

  @override
  initReactors() {
    super.initReactors();
    disposers.add(swipeReactor(
      onSwipeUp: () => widgets.onSwipeUp(),
      onSwipeLeft: () => widgets.onSwipeLeft(),
    ));
    disposers.add(widgets.beachWavesMovieStatusReactor());
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
      (failure) => errorUpdater(failure),
      (artifacts) => nokhteSessionArtifacts = ObservableList.of(artifacts),
    );
  }
}
