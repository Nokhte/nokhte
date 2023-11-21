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
  final SmartFadingAnimatedTextTrackerStore fadingTextStore;
  final FadeInAndChangeColorTextStore fadeInAndColorTextStore;
  final SwipeDetector swipe;

  _CollaboratorPoolScreenCoordinatorStoreBase({
    required this.swipe,
    required this.exitCollaboratorPoolStore,
    required this.cancelStreamStore,
    required this.getCollaboratorSearchStatusStore,
    required this.beachWavesStore,
    required this.fadingTextStore,
    required this.fadeInAndColorTextStore,
  });

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
          Modular.to.navigate('/p2p_purpose_session/');
        }
      });

  searchStatusListener() =>
      reaction((p0) => getCollaboratorSearchStatusStore.searchStatus, (p0) {
        p0.listen((value) {
          if (value == true) {
            beachWavesStore.teeUpBackToTheDepths();
            fadeInAndColorTextStore.teeUpFadeOut();
          }
        });
      });

  @action
  screenConstructorCallback() {
    fadingTextStore.startRotatingText(Seconds.get(0));
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
