// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides, overridden_fields
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_coordinator.dart';
import 'package:nokhte/app/modules/storage/domain/domain.dart';
import 'home_screen_phase4_widgets_coordinator.dart';
part 'home_screen_phase4_coordinator.g.dart';

class HomeScreenPhase4Coordinator = _HomeScreenPhase4CoordinatorBase
    with _$HomeScreenPhase4Coordinator;

abstract class _HomeScreenPhase4CoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final HomeScreenPhase4WidgetsCoordinator widgets;
  final GetNokhteSessionArtifacts getNokhteSessionArtifactsLogic;

  _HomeScreenPhase4CoordinatorBase({
    required super.collaborationLogic,
    required super.swipe,
    required super.deepLinks,
    required this.widgets,
    required this.getNokhteSessionArtifactsLogic,
    required super.captureScreen,
  }) : super(widgets: widgets);

  @observable
  ObservableList<NokhteSessionArtifactEntity> nokhteSessionArtifacts =
      ObservableList();

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await captureScreen(Screens.homePhase3);
    await getNokhteSessionArtifacts();
  }

  @override
  initReactors() {
    super.initReactors();
    swipeReactor(
      onSwipeUp: widgets.onSwipeUp,
      onSwipeRight: () {
        widgets.onSwipeRight();
        setDisableAllTouchFeedback(true);
      },
    );
    widgets.beachWavesMovieStatusReactor(
      onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
      onShoreToVibrantBlueComplete: onShoreToVibrantBlueComplete,
      onVirginStorageEntry: () {},
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
    Modular.to.navigate(
      '/storage/',
      arguments: {
        "crosShouldGlowUp": true,
      },
    );
  }
}
