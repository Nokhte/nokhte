// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/widgets/widgets.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';

import '../../../../../core/widgets/beach_widgets/shared/types/types.dart';
// * Mobx Codegen Inclusion
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

  _CollaboratorPoolScreenCoordinatorStoreBase({
    required this.exitCollaboratorPoolStore,
    required this.cancelStreamStore,
    required this.getCollaboratorSearchStatusStore,
    required this.beachWavesStore,
    required this.fadingTextStore,
    required this.fadeInAndColorTextStore,
  }) {
    reaction((p0) => beachWavesStore.movieStatus, (p0) {
      if (beachWavesStore.movieStatus == MovieStatus.finished &&
          beachWavesStore.movieMode == MovieModes.timesUp) {
        beachWavesStore.initiateBackToOceanDive();
        // beachWavesStore.backToTheDepthsCount++;
        exitCollaboratorPoolStore(NoParams());
        cancelStreamStore(NoParams());
      } else if (beachWavesStore.movieStatus == MovieStatus.finished &&
          beachWavesStore.movieMode == MovieModes.backToOceanDive) {
        Modular.to.navigate('/p2p_collaborator_pool/');
      } else if (beachWavesStore.movieStatus == MovieStatus.finished &&
          beachWavesStore.movieMode == MovieModes.backToTheDepths) {
        Modular.to.navigate('/p2p_purpose_session/');
      }
    });
    reaction((p0) => getCollaboratorSearchStatusStore.searchStatus, (p0) {
      p0.listen((value) {
        if (value == true) {
          beachWavesStore.teeUpBackToTheDepths();
          fadeInAndColorTextStore.teeUpFadeOut();
        }
      });
    });
  }

  @action
  screenConstructorCallback() {
    beachWavesStore.initiateTimesUp(
      timerLength: const Duration(seconds: 45),
      // timerLength: const Duration(seconds: 10),
    );
    getCollaboratorSearchStatusStore();
  }

  @override
  List<Object> get props => [];
}
