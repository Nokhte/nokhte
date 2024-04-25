// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides, overridden_fields
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/coordinators/user_information_coordinator.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:nokhte/app/modules/storage/domain/domain.dart';
part 'compass_and_storage_guide_coordinator.g.dart';

class CompassAndStorageGuideCoordinator = _CompassAndStorageGuideCoordinatorBase
    with _$CompassAndStorageGuideCoordinator;

abstract class _CompassAndStorageGuideCoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final CompassAndStorageGuideWidgetsCoordinator widgets;
  final GetNokhteSessionArtifacts getNokhteSessionArtifactsLogic;
  final UserInformationCoordinator userInformation;

  _CompassAndStorageGuideCoordinatorBase({
    required super.sessionStarters,
    required super.swipe,
    required super.deepLinks,
    required this.widgets,
    required this.getNokhteSessionArtifactsLogic,
    required this.userInformation,
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
    await captureScreen(Screens.compassAndStorageGuideHome);
    await getNokhteSessionArtifacts();
  }

  @override
  initReactors() {
    super.initReactors();
    swipeReactor(
      onSwipeUp: () {},
      onSwipeRight: () {
        widgets.onSwipeRight();
      },
    );
    widgets.beachWavesMovieStatusReactor(
      onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
      onShoreToDeepSeaComplete: onShoreToDeepSeaComplete,
      onStorageEntry: onSubsequentStorageEntry,
      onAnyToShoreComplete: () {
        setDisableAllTouchFeedback(false);
      },
    );
    swipeCoordinatesReactor(widgets.onSwipeCoordinatesChanged);
    tapReactor();
  }

  @action
  getNokhteSessionArtifacts() async {
    final res = await getNokhteSessionArtifactsLogic(NoParams());
    res.fold(
      (failure) => errorUpdater(failure),
      (artifacts) => nokhteSessionArtifacts = ObservableList.of(artifacts),
    );
  }

  tapReactor() => reaction((p0) => tap.currentTapPosition, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onTap(p0);
        });
      });

  @action
  onVirginStorageEntry() {
    Modular.to.navigate(
      '/storage/content',
      arguments: {
        "content": nokhteSessionArtifacts.first,
        "isFirstTime": true,
      },
    );
  }
}
