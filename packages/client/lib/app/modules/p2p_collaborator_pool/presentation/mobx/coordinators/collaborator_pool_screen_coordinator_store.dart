// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/widgets/beach_waves/beach_waves.dart';
import 'package:primala/app/core/widgets/fade_in_and_change_color_text/stack/mobx/fade_in_and_change_color_text_store.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/smart_fading_animated_text.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
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
    reaction((p0) => beachWavesStore.movieMode, (p0) {
      if (beachWavesStore.movieMode == MovieModes.backToOceanDive) {
        exitCollaboratorPoolStore(NoParams());
        cancelStreamStore(NoParams());
        // I would suggest testing the infrastructure & getting to the bottom
        // of it when u get
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
