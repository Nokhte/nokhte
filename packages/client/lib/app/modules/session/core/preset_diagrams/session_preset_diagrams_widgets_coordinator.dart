// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// import 'dart:async';
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'session_preset_diagrams_widgets_coordinator.g.dart';

class SessionPresetDiagramsWidgetsCoordinator = _SessionPresetDiagramsWidgetsCoordinatorBase
    with _$SessionPresetDiagramsWidgetsCoordinator;

abstract class _SessionPresetDiagramsWidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final BeachWavesStore beachWaves;
  final SmartTextStore primarySmartText;

  _SessionPresetDiagramsWidgetsCoordinatorBase({
    required this.beachWaves,
    required super.wifiDisconnectOverlay,
    required this.primarySmartText,
  });

  @action
  constructor() {
    beachWaves.setMovieMode(
      BeachWaveMovieModes.deepSeaToSky,
    );
    primarySmartText.setMessagesData(SessionLists.previewHeader);
  }

  @action
  onCollaboratorLeft() {
    primarySmartText.setWidgetVisibility(false);
  }

  @action
  onCollaboratorJoined() {
    primarySmartText.setWidgetVisibility(primarySmartText.pastShowWidget);
  }
}
