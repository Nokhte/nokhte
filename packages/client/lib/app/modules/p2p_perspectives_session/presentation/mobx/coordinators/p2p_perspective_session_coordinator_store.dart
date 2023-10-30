// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/gyroscopic/presentation/presentation.dart';
import 'package:nokhte/app/core/modules/voice_call/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/presentation/mobx/main/main.dart';
// * Mobx Codegen Inclusion
part 'p2p_perspective_session_coordinator_store.g.dart';

class P2PPerspectiveSessionCoordinatorStore = _P2PPerspectiveSessionCoordinatorStoreBase
    with _$P2PPerspectiveSessionCoordinatorStore;

abstract class _P2PPerspectiveSessionCoordinatorStoreBase extends Equatable
    with Store {
  final VoiceCallActionsStore voiceCall;
  final QuadrantAPI quadrantAPI;
  final CommitThePerspectivesStore commitThePerspectives;
  final CreateAPerspectivesSessionStore createSession;
  final FetchPerspectivesStreamStore perspectivesStream;
  final UpdateCurrentQuadrantStore updateStore;
  final UpdateTheStagingAreaStore updateStaging;
  final BeachHorizonWaterTrackerStore beachHorizonWater;
  final BeachSkyStore beachSky;
  //todo add the future widget managment stores as well

  _P2PPerspectiveSessionCoordinatorStoreBase({
    required this.voiceCall,
    required this.quadrantAPI,
    required this.commitThePerspectives,
    required this.createSession,
    required this.perspectivesStream,
    required this.updateStore,
    required this.updateStaging,
    required this.beachHorizonWater,
    required this.beachSky,
  });

  @action
  screenConstructor() async {
    print("Is this running??????");
    final now = DateTime.now();
    beachHorizonWater.selectTimeBasedMovie(
      now,
      WaterColorsAndStops.oceanDiveWater,
    );
    beachSky.selectTimeBasedMovie(now);
    //
  }

  @override
  List<Object> get props => [];
}
