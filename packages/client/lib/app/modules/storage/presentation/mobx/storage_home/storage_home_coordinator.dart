// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/home/presentation/mobx/mobx.dart';
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

  @observable
  bool crossShouldUseObserver = true;

  @action
  setCrossShouldUseObserver(bool value) => crossShouldUseObserver = value;

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
    beachWavesMovieStatusReactor();
    sessionCardEditReactor();
    sessionCardTapReactor();
  }

  swipeReactor() => reaction((p0) => swipe.directionsType, (p0) {
        switch (p0) {
          case GestureDirections.left:
            ifTouchIsNotDisabled(() {
              setCrossShouldUseObserver(true);
              widgets.onSwipeLeft();
              setDisableAllTouchFeedback(true);
            });
          default:
            break;
        }
      });

  beachWavesMovieStatusReactor() =>
      reaction((p0) => widgets.beachWaves.movieStatus, (p0) {
        if (p0 == MovieStatus.finished &&
            widgets.beachWaves.movieMode ==
                BeachWaveMovieModes.onShoreToVibrantBlue) {
          widgets.dispose();
          onAnimationComplete();
        } else if (p0 == MovieStatus.finished &&
            widgets.beachWaves.movieMode ==
                BeachWaveMovieModes.vibrantBlueGradToDrySand) {
          widgets.dispose();
          Modular.to.navigate("/storage/content", arguments: {
            "content":
                nokhteSessionArtifacts[widgets.sessionCard.lastTappedIndex],
            "isFirstTime": false,
          });
        }
      });

  sessionCardEditReactor() => reaction(
        (p0) => widgets.sessionCard.lastEditedTitle,
        (p0) async {
          await updateSessionAlias(
            UpdateSessionAliasParams(
              id: widgets.sessionCard.lastEditedId,
              newAlias: p0,
            ),
          );
        },
      );

  sessionCardTapReactor() =>
      reaction((p0) => widgets.sessionCard.lastTappedIndex, (p0) {
        ifTouchIsNotDisabled(() {
          widgets.onSessionCardTapped();
          setDisableAllTouchFeedback(true);
        });
      });
}
