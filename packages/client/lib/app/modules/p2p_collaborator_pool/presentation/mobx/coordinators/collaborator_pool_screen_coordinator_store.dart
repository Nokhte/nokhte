// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/mobx/coordinator/update_existing_collaborations_coordinator.dart';
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
  final UpdateExistingCollaborationsCoordinator updateExistingCollaborations;

  _CollaboratorPoolScreenCoordinatorStoreBase({
    required this.exitCollaboratorPoolStore,
    required this.updateExistingCollaborations,
    required this.cancelStreamStore,
    required this.getCollaboratorSearchStatusStore,
    required super.beachWaves,
    required this.fadeInAndColorTextStore,
  });

  beachWavesMovieStatusListener() =>
      reaction((p0) => beachWaves.movieStatus, (p0) {
        print(
            "HEYYYYYYYYY IS THIS WORKING???? ${beachWaves.movieStatus} ${beachWaves.movieMode} ${beachWaves.movie.duration}");
        if (beachWaves.movieStatus == MovieStatus.finished &&
            beachWaves.movieMode == BeachWaveMovieModes.timesUp) {
          beachWaves.initiateBackToOceanDive();
          exitCollaboratorPoolStore(NoParams());
          cancelStreamStore(NoParams());
        } else if (beachWaves.movieStatus == MovieStatus.finished &&
            beachWaves.movieMode == BeachWaveMovieModes.backToOceanDive) {
          Modular.to.navigate('/p2p_collaborator_pool/');
        } else if (beachWaves.movieStatus == MovieStatus.finished &&
            beachWaves.movieMode == BeachWaveMovieModes.backToTheDepths) {
          Modular.to.navigate('/p2p_purpose_session/');
        }
      });

  searchStatusListener() =>
      reaction((p0) => getCollaboratorSearchStatusStore.searchStatus, (p0) {
        p0.listen((value) async {
          print("value $value");
          if (value.hasFoundTheirCollaborator && !value.hasEntered) {
            await updateExistingCollaborations
                .updateIndividualCollaboratorEntryStatus(true);
            Future.delayed(Seconds.get(2), () {
              beachWaves.teeUpBackToTheDepths();
              fadeInAndColorTextStore.teeUpFadeOut();
            });
            print("did the first reaction run search status? $value?");
          }
        });
      });

  @action
  screenConstructorCallback() {
    final duration = kDebugMode ? Seconds.get(10) : Seconds.get(45);
    beachWaves.initiateTimesUp(
      timerLength: duration,
    );
    getCollaboratorSearchStatusStore();
    searchStatusListener();
    beachWavesMovieStatusListener();
  }
}
