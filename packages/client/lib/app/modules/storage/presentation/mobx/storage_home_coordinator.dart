// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/coordinators/shared/base_home_screen_router_coordinator.dart';
import 'package:nokhte/app/modules/storage/domain/domain.dart';
import 'storage_home_widgets_coordinator.dart';
part 'storage_home_coordinator.g.dart';

class StorageHomeCoordinator = _StorageHomeCoordinatorBase
    with _$StorageHomeCoordinator;

abstract class _StorageHomeCoordinatorBase
    extends BaseHomeScreenRouterCoordinator with Store {
  final StorageHomeWidgetsCoordinator widgets;
  final GetNokhteSessionArtifacts getNokhteSessionArtifactsLogic;
  final UpdateSessionAlias updateSessionAliasLogic;

  final SwipeDetector swipe;
  _StorageHomeCoordinatorBase({
    required super.getUserInfo,
    required super.captureScreen,
    required this.getNokhteSessionArtifactsLogic,
    required this.updateSessionAliasLogic,
    required this.widgets,
    required this.swipe,
  });

  @observable
  ObservableList<NokhteSessionArtifactEntity> nokhteSessionArtifacts =
      ObservableList();

  @observable
  bool aliasIsUpdated = false;

  @action
  constructor() async {
    widgets.constructor();
    initReactors();
    await getUserInfo(NoParams());
    await getNokhteSessionArtifacts();
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
  updateSessionAlias(UpdateSessionAliasParams params) async {
    final res = await updateSessionAliasLogic(params);
    res.fold(
      (failure) => errorUpdater(failure),
      (updateStatus) => aliasIsUpdated = updateStatus,
    );
  }

  initReactors() {
    swipeReactor();
    widgets.beachWavesMovieStatusReactor(onAnimationComplete);
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.left:
            ifTouchIsNotDisabled(() {
              widgets.onSwipeLeft();
              setDisableAllTouchFeedback(true);
            });
          default:
            break;
        }
      });
}
