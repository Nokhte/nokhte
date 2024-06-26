// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides, overridden_fields
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
part 'short_qr_guide_coordinator.g.dart';

class ShortQrGuideCoordinator = _ShortQrGuideCoordinatorBase
    with _$ShortQrGuideCoordinator;

abstract class _ShortQrGuideCoordinatorBase extends BaseHomeScreenCoordinator
    with Store {
  final ShortQrGuideWidgetsCoordinator widgets;
  final GetNokhteSessionArtifacts getNokhteSessionArtifactsLogic;

  _ShortQrGuideCoordinatorBase({
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
    await base.captureScreen(HomeConstants.shortQrGuide);
    await getNokhteSessionArtifacts();
  }

  @override
  initReactors() {
    super.initReactors();
    base.disposers.add(swipeReactor(
      onSwipeUp: () {
        // setDisableAllTouchFeedback(true);
        widgets.onSwipeUp();
      },
      onSwipeRight: () {
        widgets.onSwipeRight();
        // setDisableAllTouchFeedback(true);
      },
    ));
    base.disposers.add(tapReactor());
    base.disposers.add(widgets.beachWavesMovieStatusReactor(
      onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
      onShoreToDeepSeaComplete: onShoreToDeepSeaComplete,
      onStorageEntry: onSubsequentStorageEntry,
      onAnyToShoreComplete: () {
        base.setDisableAllTouchFeedback(false);
      },
    ));
    base.disposers
        .add(swipeCoordinatesReactor(widgets.onSwipeCoordinatesChanged));
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
        if (base.isInErrorMode) {
          widgets.onErrorResolved(() {
            base.setIsInErrorMode(true);
          });
        }
        base.ifTouchIsNotDisabled(() {
          widgets.onTap(tap.currentTapPosition);
        });
      });

  @action
  getNokhteSessionArtifacts() async {
    final res = await getNokhteSessionArtifactsLogic(NoParams());
    res.fold(
      (failure) => base.baseLogic.errorUpdater(failure),
      (artifacts) => nokhteSessionArtifacts = ObservableList.of(artifacts),
    );
  }

  @action
  onSubsequentStorageEntry() {
    Modular.to.navigate(StorageConstants.root);
  }
}
