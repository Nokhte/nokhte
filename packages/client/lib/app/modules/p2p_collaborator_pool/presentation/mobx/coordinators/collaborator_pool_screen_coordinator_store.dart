// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';

part 'collaborator_pool_screen_coordinator_store.g.dart';

class CollaboratorPoolScreenCoordinatorStore = _CollaboratorPoolScreenCoordinatorStoreBase
    with _$CollaboratorPoolScreenCoordinatorStore;

abstract class _CollaboratorPoolScreenCoordinatorStoreBase extends Equatable
    with Store {
  final ExitCollaboratorPoolStore exitCollaboratorPoolStore;
  final CancelCollaboratorStreamStore cancelStreamStore;
  final GetCollaboratorSearchStatusStore getCollaboratorSearchStatusStore;
  final BeachWavesTrackerStore beachWavesStore;
  final FadeInAndChangeColorTextStore fadeInAndColorTextStore;

  _CollaboratorPoolScreenCoordinatorStoreBase({
    required this.exitCollaboratorPoolStore,
    required this.cancelStreamStore,
    required this.getCollaboratorSearchStatusStore,
    required this.beachWavesStore,
    required this.fadeInAndColorTextStore,
  });
  // so click a bunch to see where it comes from

  @action
  beachWavesMovieStatusListener() =>
      reaction((p0) => beachWavesStore.movieStatus, (p0) {
        print(
            "what's happening here?? ${beachWavesStore.movieStatus} ${beachWavesStore.movieMode}");
        if (beachWavesStore.movieStatus == MovieStatus.finished &&
            beachWavesStore.movieMode == BeachWaveMovieModes.timesUp) {
          beachWavesStore.initiateBackToOceanDive();
          exitCollaboratorPoolStore(NoParams());
          cancelStreamStore(NoParams());
        } else if (beachWavesStore.movieStatus == MovieStatus.finished &&
            beachWavesStore.movieMode == BeachWaveMovieModes.backToOceanDive) {
          Modular.to.navigate('/p2p_collaborator_pool/');
        } else if (beachWavesStore.movieStatus == MovieStatus.finished &&
            beachWavesStore.movieMode == BeachWaveMovieModes.backToTheDepths) {
          print("did the nav to purpose session work??");
          Modular.to.navigate('/p2p_purpose_session/');
        }
      });

  @action
  searchStatusListener() =>
      reaction((p0) => getCollaboratorSearchStatusStore.searchStatus, (p0) {
        p0.listen((value) {
          final Stopwatch stopwatch = Stopwatch();
          stopwatch.start();
          if (value == true) {
            print("did this piece run??");
            // if (stopwatch.elapsedMilliseconds < 1000) {
            Future.delayed(Seconds.get(2), () {
              beachWavesStore.teeUpBackToTheDepths();
              fadeInAndColorTextStore.teeUpFadeOut();
            });
            // } else {
            // beachWavesStore.teeUpBackToTheDepths();
            // fadeInAndColorTextStore.teeUpFadeOut();
            // ship this in the morning and see if this fixes the issue
            // also click around alot to see how we can counter act the problem
            // of the transition not happening sometimes
            // }
          }
        });
      });

  @action
  screenConstructorCallback() {
    beachWavesStore.initiateTimesUp(
      timerLength: Seconds.get(45),
    );
    getCollaboratorSearchStatusStore();
    searchStatusListener();
    beachWavesMovieStatusListener();
  }

  @override
  List<Object> get props => [];
}
