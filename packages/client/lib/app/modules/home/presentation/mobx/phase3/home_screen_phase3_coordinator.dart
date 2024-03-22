// ignore_for_file: must_be_immutable, library_private_types_in_public_api, annotate_overrides, overridden_fields
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/core/modules/user_information/mobx/coordinators/user_information_coordinator.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
import 'package:nokhte/app/modules/storage/domain/domain.dart';
part 'home_screen_phase3_coordinator.g.dart';

class HomeScreenPhase3Coordinator = _HomeScreenPhase3CoordinatorBase
    with _$HomeScreenPhase3Coordinator;

abstract class _HomeScreenPhase3CoordinatorBase
    extends BaseHomeScreenCoordinator with Store {
  final HomeScreenPhase3WidgetsCoordinator widgets;
  final GetNokhteSessionArtifacts getNokhteSessionArtifactsLogic;
  final UserInformationCoordinator userInformation;

  _HomeScreenPhase3CoordinatorBase({
    required super.collaborationLogic,
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
      onSwipeUp: () {
        setDisableAllTouchFeedback(true);
        widgets.onSwipeUp();
      },
      onSwipeRight: () async {
        widgets.onSwipeRight();
        setDisableAllTouchFeedback(true);
        await userInformation.updateHasEnteredStorageLogic(true);
      },
    );
    widgets.beachWavesMovieStatusReactor(
      onShoreToOceanDiveComplete: onShoreToOceanDiveComplete,
      onShoreToVibrantBlueComplete: onShoreToVibrantBlueComplete,
      onVirginStorageEntry: onVirginStorageEntry,
      onSubsequentStorageEntry: () {},
      onAnyToShoreComplete: () {
        setDisableAllTouchFeedback(false);
      },
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
