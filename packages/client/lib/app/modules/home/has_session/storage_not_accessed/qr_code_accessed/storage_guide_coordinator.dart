// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides, overridden_fields
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
part 'storage_guide_coordinator.g.dart';

class StorageGuideCoordinator = _StorageGuideCoordinatorBase
    with _$StorageGuideCoordinator;

abstract class _StorageGuideCoordinatorBase extends BaseHomeScreenCoordinator
    with Store {
  final StorageGuideWidgetsCoordinator widgets;
  final GetNokhteSessionArtifacts getNokhteSessionArtifactsLogic;

  _StorageGuideCoordinatorBase({
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
    await captureScreen(HomeConstants.storageGuide);
    await getNokhteSessionArtifacts();
  }

  @override
  initReactors() {
    super.initReactors();
    disposers.add(swipeReactor(
      onSwipeUp: () {
        widgets.onSwipeUp();
      },
      onSwipeRight: () async {
        widgets.onSwipeRight();
      },
    ));
    disposers.add(widgets.beachWavesMovieStatusReactor(
      onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
      onShoreToDeepSeaComplete: onShoreToDeepSeaComplete,
      onStorageEntry: onSubsequentStorageEntry,
      onAnyToShoreComplete: () {
        setDisableAllTouchFeedback(false);
      },
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
