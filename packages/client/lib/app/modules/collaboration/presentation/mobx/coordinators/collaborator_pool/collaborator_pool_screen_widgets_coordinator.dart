// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/beach_widgets/shared/shared.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'collaborator_pool_screen_widgets_coordinator.g.dart';

class CollaboratorPoolScreenWidgetsCoordinator = _CollaboratorPoolScreenWidgetsCoordinatorBase
    with _$CollaboratorPoolScreenWidgetsCoordinator;

abstract class _CollaboratorPoolScreenWidgetsCoordinatorBase extends Equatable
    with Store {
  final BeachWavesStore beachWaves;
  final WifiDisconnectOverlayStore wifiDisconnectOverlay;
  // add waitingOnCollaborator text;

  _CollaboratorPoolScreenWidgetsCoordinatorBase({
    required this.beachWaves,
    required this.wifiDisconnectOverlay,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(BeachWaveMovieModes.vibrantBlueGradientToTimesUp);
  }

  @override
  List<Object> get props => [];
}
