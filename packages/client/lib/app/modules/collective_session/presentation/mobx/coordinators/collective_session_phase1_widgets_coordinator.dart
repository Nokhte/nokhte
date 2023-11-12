// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_perspectives_widgets_store.dart';
part 'collective_session_phase1_widgets_coordinator.g.dart';

class CollectiveSessionPhase1WidgetsCoordinator = _CollectiveSessionPhase1WidgetsCoordinatorBase
    with _$CollectiveSessionPhase1WidgetsCoordinator;

abstract class _CollectiveSessionPhase1WidgetsCoordinatorBase
    extends BasePerspectivesWidgetsStore with Store {
  _CollectiveSessionPhase1WidgetsCoordinatorBase({
    required super.beachHorizonWater,
    required super.beachSky,
    required super.perspectivesMap,
    required super.collaborativeTextEditor,
    required super.beachWaves,
  });
  @override
  List<Object> get props => [];
}
