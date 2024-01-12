// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/mobx/coordinator/existing_collaborations_coordinator.dart';
import 'package:nokhte/app/core/types/types.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

part 'collaborator_pool_screen_coordinator_store.g.dart';

class CollaboratorPoolScreenCoordinatorStore = _CollaboratorPoolScreenCoordinatorStoreBase
    with _$CollaboratorPoolScreenCoordinatorStore;

abstract class _CollaboratorPoolScreenCoordinatorStoreBase
    extends BaseCoordinator with Store {
  final ExitCollaboratorPoolStore exitCollaboratorPoolStore;
  final CancelCollaboratorStreamStore cancelStreamStore;
  final GetCollaboratorSearchStatusStore getCollaboratorSearchStatusStore;
  final FadeInAndChangeColorTextStore fadeInAndColorTextStore;
  final NewBeachWavesStore newBeachWaves;

  final ExistingCollaborationsCoordinator existingCollaborations;

  @observable
  bool canEnterTheCollaboration = false;

  late StreamSubscription<bool> stream;

  @action
  toggleCanEnterTheCollaboration() =>
      canEnterTheCollaboration = !canEnterTheCollaboration;

  _CollaboratorPoolScreenCoordinatorStoreBase({
    required this.exitCollaboratorPoolStore,
    required this.newBeachWaves,
    required this.existingCollaborations,
    required this.cancelStreamStore,
    required this.getCollaboratorSearchStatusStore,
    required this.fadeInAndColorTextStore,
  });

  cleanUpAndTransitionBackToOceanDive() async {
    await exitCollaboratorPoolStore(NoParams());
    await cancelStreamStore(NoParams());
    await getCollaboratorSearchStatusStore.searchStatus.close();
    Modular.to.navigate('/p2p_collaborator_pool/');
  }

  @action
  searchStatusListener() =>
      reaction((p0) => getCollaboratorSearchStatusStore.searchStatus, (p0) {
        stream = p0.listen((value) async {
          if (value) {
            newBeachWaves.setMovieMode(
                BeachWaveMovieModes.timesUpDynamicPointToTheDepthsSetup);
            fadeInAndColorTextStore.teeUpFadeOut();
          }
        });
      });

  beachWavesListener() => reaction((p0) => newBeachWaves.movieStatus, (p0) {
        print("$p0 ${newBeachWaves.movieMode}");
        if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode == BeachWaveMovieModes.timesUp) {
          newBeachWaves.setMovieMode(BeachWaveMovieModes.timesUpEndToOceanDive);
          newBeachWaves.currentStore.initMovie(NoParams());
        } else if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode ==
                BeachWaveMovieModes.timesUpEndToOceanDive) {
          Modular.to.navigate('/p2p_collaborator_pool/');
        } else if (newBeachWaves.movieStatus == MovieStatus.finished &&
            newBeachWaves.movieMode ==
                BeachWaveMovieModes.timesUpDynamicPointToTheDepths) {
          print("did this one run early");
          getCollaboratorSearchStatusStore.resetStream();
          existingCollaborations.updateIndividualCollaboratorEntryStatus(true);
          Modular.to.navigate('/p2p_purpose_session/');
        }
      });

  @action
  screenConstructorCallback() {
    final duration = kDebugMode ? Seconds.get(10) : Seconds.get(45);
    newBeachWaves.setMovieMode(BeachWaveMovieModes.timesUp);
    newBeachWaves.currentStore.initMovie(duration);
    beachWavesListener();
    getCollaboratorSearchStatusStore();
    searchStatusListener();
  }
}
