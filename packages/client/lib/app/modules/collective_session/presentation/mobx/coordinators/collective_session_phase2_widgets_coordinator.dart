// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'collective_session_phase2_widgets_coordinator.g.dart';

class CollectiveSessionPhase2WidgetsCoordinator = _CollectiveSessionPhase2WidgetsCoordinatorBase
    with _$CollectiveSessionPhase2WidgetsCoordinator;

abstract class _CollectiveSessionPhase2WidgetsCoordinatorBase extends Equatable
    with Store {
  final CollaborativeTextEditorTrackerStore collaborativeTextEditor;
  final BeachWavesTrackerStore beachWaves;
  final GesturePillStore gesturePill;

  _CollectiveSessionPhase2WidgetsCoordinatorBase({
    required this.collaborativeTextEditor,
    required this.beachWaves,
    required this.gesturePill,
  });
  @override
  List<Object> get props => [];
}
