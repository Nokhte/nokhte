// ignore_for_file: must_be_immutable, library_private_types_in_public_api,  overridden_fields
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/home/home.dart';
import 'package:nokhte/app/modules/storage/storage.dart';
part 'short_qr_guide_coordinator.g.dart';

class ShortQrGuideCoordinator = _ShortQrGuideCoordinatorBase
    with _$ShortQrGuideCoordinator;

abstract class _ShortQrGuideCoordinatorBase extends BaseHomeScreenCoordinator
    with Store {
  @override
  final ShortQrGuideWidgetsCoordinator widgets;
  final GetNokhteSessionArtifacts getNokhteSessionArtifactsLogic;

  _ShortQrGuideCoordinatorBase({
    required super.swipe,
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
    await captureScreen(HomeConstants.shortQrGuide);
    await getNokhteSessionArtifacts();
  }

  @override
  initReactors() {
    super.initReactors();
    disposers.add(swipeReactor(
      onSwipeUp: () => widgets.onSwipeUp(),
      onSwipeLeft: () => widgets.onSwipeLeft(),
    ));
    disposers.add(tapReactor());
    disposers.add(swipeCoordinatesReactor(widgets.initWaterWake));
  }

  tapReactor() => reaction((p0) => tap.tapCount, (p0) {
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
