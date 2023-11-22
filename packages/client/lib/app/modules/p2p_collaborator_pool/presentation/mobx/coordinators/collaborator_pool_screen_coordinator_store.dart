// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';

part 'collaborator_pool_screen_coordinator_store.g.dart';

class CollaboratorPoolScreenCoordinatorStore = _CollaboratorPoolScreenCoordinatorStoreBase
    with _$CollaboratorPoolScreenCoordinatorStore;

abstract class _CollaboratorPoolScreenCoordinatorStoreBase
    extends BaseCoordinator with Store {
  final ExitCollaboratorPoolStore exitCollaboratorPoolStore;
  final CancelCollaboratorStreamStore cancelStreamStore;
  final GetCollaboratorSearchStatusStore getCollaboratorSearchStatusStore;
  final FadeInAndChangeColorTextStore fadeInAndColorTextStore;

  _CollaboratorPoolScreenCoordinatorStoreBase({
    required this.exitCollaboratorPoolStore,
    required this.cancelStreamStore,
    required this.getCollaboratorSearchStatusStore,
    required super.beachWaves,
    required this.fadeInAndColorTextStore,
  });

  @action
  beachWavesMovieStatusListener() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        if (beachWaves.movieStatus == MovieStatus.inProgress &&
            beachWaves.movieMode == BeachWaveMovieModes.timesUp) {
          delayedNavigation(() => beachWaves.initiateBackToOceanDive());
          exitCollaboratorPoolStore(NoParams());
          cancelStreamStore(NoParams());
        } else if (beachWaves.movieStatus == MovieStatus.inProgress &&
            beachWaves.movieMode == BeachWaveMovieModes.backToOceanDive) {
          delayedNavigation(
              () => Modular.to.navigate('/p2p_collaborator_pool/'));
        } else if (beachWaves.movieStatus == MovieStatus.inProgress &&
            beachWaves.movieMode == BeachWaveMovieModes.backToTheDepths) {
          delayedNavigation(() => Modular.to.navigate('/p2p_purpose_session/'));
        }
      });

  @action
  searchStatusListener() =>
      reaction((p0) => getCollaboratorSearchStatusStore.searchStatus, (p0) {
        p0.listen((value) {
          final Stopwatch stopwatch = Stopwatch();
          stopwatch.start();
          if (value == true) {
            Future.delayed(Seconds.get(2), () {
              beachWaves.teeUpBackToTheDepths();
              fadeInAndColorTextStore.teeUpFadeOut();
            });
          }
        });
      });

  @action
  screenConstructorCallback() {
    beachWaves.initiateTimesUp(
      timerLength: Seconds.get(45),
    );
    getCollaboratorSearchStatusStore();
    searchStatusListener();
    beachWavesMovieStatusListener();
  }

  @override
  List<Object> get props => [];
}
