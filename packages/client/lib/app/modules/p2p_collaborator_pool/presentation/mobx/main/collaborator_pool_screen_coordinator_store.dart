// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:primala/app/core/widgets/beach_waves/stack/presentation/mobx/beach_waves_tracker_store.dart';
// import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/constants/constants.dart';
import 'package:primala/app/core/widgets/smart_fading_animated_text/stack/presentation/mobx/smart_fading_animated_text_tracker_store.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/presentation/mobx/mobx.dart';
// * Mobx Codegen Inclusion
part 'collaborator_pool_screen_coordinator_store.g.dart';

class CollaboratorPoolScreenCoordinatorStore = _CollaboratorPoolScreenCoordinatorStoreBase
    with _$CollaboratorPoolScreenCoordinatorStore;

abstract class _CollaboratorPoolScreenCoordinatorStoreBase extends Equatable
    with Store {
  final CustomWidgetsTrackerStore widgetStore;
  final ExitCollaboratorPoolStore exitCollaboratorPoolStore;
  final BeachWavesTrackerStore beachWavesStore;
  final SmartFadingAnimatedTextTrackerStore fadingTextStore;

  _CollaboratorPoolScreenCoordinatorStoreBase({
    required this.widgetStore,
    required this.exitCollaboratorPoolStore,
  })  : beachWavesStore = widgetStore.beachWavesStore,
        fadingTextStore = widgetStore.smartFadingAnimatedTextStore;

  @action
  screenConstructorCallback() {
    // widgetStore.beachWavesStore.initiateToTheDepths();
    beachWavesStore.initiateTimesUp(
      timerLength: const Duration(seconds: 45),
      // timerLength: const Duration(seconds: 10),
    );
  }

  @override
  List<Object> get props => [];
}
