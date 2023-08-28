// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/constants/types/movie_modes.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/beach_waves_tracker_store.dart';
// import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/constants/constants.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/presentation/mobx/smart_fading_animated_text_tracker_store.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/main/sub_stores/logic/cancel_collaborator_stream_store.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/main/sub_stores/logic/get_collaborator_search_status_store.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'collaborator_pool_screen_coordinator_store.g.dart';

class CollaboratorPoolScreenCoordinatorStore = _CollaboratorPoolScreenCoordinatorStoreBase
    with _$CollaboratorPoolScreenCoordinatorStore;

abstract class _CollaboratorPoolScreenCoordinatorStoreBase extends Equatable
    with Store {
  final CustomWidgetsTrackerStore widgetStore;
  final ExitCollaboratorPoolStore exitCollaboratorPoolStore;
  final CancelCollaboratorStreamStore cancelStreamStore;
  final GetCollaboratorSearchStatusStore getCollaboratorSearchStatusStore;
  late BeachWavesTrackerStore beachWavesStore;
  late SmartFadingAnimatedTextTrackerStore fadingTextStore;

  _CollaboratorPoolScreenCoordinatorStoreBase({
    required this.widgetStore,
    required this.exitCollaboratorPoolStore,
    required this.cancelStreamStore,
    required this.getCollaboratorSearchStatusStore,
  }) {
    beachWavesStore = widgetStore.beachWavesStore;
    fadingTextStore = widgetStore.smartFadingAnimatedTextStore;
    reaction((p0) => widgetStore.beachWavesStore.movieMode, (p0) {
      if (widgetStore.beachWavesStore.movieMode == MovieModes.backToOceanDive) {
        exitCollaboratorPoolStore(NoParams());
        cancelStreamStore(NoParams());
      }
    });

    reaction((p0) => getCollaboratorSearchStatusStore.searchStatus, (p0) async {
      if (await getCollaboratorSearchStatusStore.searchStatus.first) {
        // do movie mode transition here
        print("a match was indeed made!!");
      }
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
