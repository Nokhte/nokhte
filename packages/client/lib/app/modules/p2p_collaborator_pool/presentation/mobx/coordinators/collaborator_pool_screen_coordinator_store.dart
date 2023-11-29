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
  final ExistingCollaborationsCoordinator existingCollaborations;

  @observable
  bool canEnterTheCollaboration = false;

  late StreamSubscription<CollaboratorSearchAndEntryStatus> stream;

  @action
  toggleCanEnterTheCollaboration() =>
      canEnterTheCollaboration = !canEnterTheCollaboration;

  _CollaboratorPoolScreenCoordinatorStoreBase({
    required this.exitCollaboratorPoolStore,
    required this.existingCollaborations,
    required this.cancelStreamStore,
    required this.getCollaboratorSearchStatusStore,
    required super.beachWaves,
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
          if (value.hasFoundTheirCollaborator && !value.hasEntered) {
            toggleCanEnterTheCollaboration();
            beachWaves.teeUpBackToTheDepths();
            fadeInAndColorTextStore.teeUpFadeOut();
            Future.delayed(Seconds.get(3), () async {
              // delayedNavigation(() {
              if (canEnterTheCollaboration) {
                getCollaboratorSearchStatusStore.resetStream();
                Modular.to.navigate('/p2p_purpose_session/');
                existingCollaborations
                    .updateIndividualCollaboratorEntryStatus(true);
              }
              // });
            });
          }
        });
      });

  @action
  goBackToShore(bool canEnterTheCollaboration) {
    if (beachWaves.movieMode == BeachWaveMovieModes.timesUp) {
      print("is the transition to speak happening??");
      beachWaves.initiateBackToOceanDive();
      delayedNavigation(() async {
        exitCollaboratorPoolStore(NoParams());
        cancelStreamStore(NoParams());
        await stream.cancel();
        Modular.to.navigate('/p2p_collaborator_pool/');
      });
    }
  }

  @action
  screenConstructorCallback() {
    final duration = kDebugMode ? Seconds.get(10) : Seconds.get(45);
    beachWaves.initiateTimesUp(
      timerLength: duration,
    );
    delayedNavigation(() => goBackToShore(canEnterTheCollaboration));
    // Future.delayed(duration, () => goBackToShore());
    getCollaboratorSearchStatusStore();
    searchStatusListener();
  }
}
