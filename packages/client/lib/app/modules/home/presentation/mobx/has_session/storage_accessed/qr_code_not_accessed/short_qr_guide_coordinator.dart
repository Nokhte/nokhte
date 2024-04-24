// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides, overridden_fields
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:nokhte/app/modules/storage/domain/domain.dart';
part 'short_qr_guide_coordinator.g.dart';

class ShortQrGuideCoordinator = _ShortQrGuideCoordinatorBase
    with _$ShortQrGuideCoordinator;

abstract class _ShortQrGuideCoordinatorBase extends BaseHomeScreenCoordinator
    with Store {
  final ShortQrGuideWidgetsCoordinator widgets;
  final GetNokhteSessionArtifacts getNokhteSessionArtifactsLogic;

  _ShortQrGuideCoordinatorBase({
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
    await captureScreen(Screens.shortQrGuideHome);
    await getNokhteSessionArtifacts();
  }

  @override
  initReactors() {
    super.initReactors();
    swipeReactor(
      onSwipeUp: () {
        // setDisableAllTouchFeedback(true);
        widgets.onSwipeUp();
      },
      onSwipeRight: () {
        widgets.onSwipeRight();
        // setDisableAllTouchFeedback(true);
      },
    );
    tapReactor();
    widgets.beachWavesMovieStatusReactor(
      onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
      onShoreToDeepSeaComplete: onShoreToDeepSeaComplete,
      onStorageEntry: onSubsequentStorageEntry,
      onAnyToShoreComplete: () {
        setDisableAllTouchFeedback(false);
      },
    );
    swipeCoordinatesReactor(widgets.onSwipeCoordinatesChanged);
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

  @action
  onSubsequentStorageEntry() {
    Modular.to.navigate('/storage/');
  }
}
