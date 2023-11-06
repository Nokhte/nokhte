// ignore_for_file: must_be_immutable, library_private_types_in_public_api
// * Mobx Import
import 'package:mobx/mobx.dart';
// * Equatable Import
import 'package:nokhte/app/core/mobx/base_perspectives_widgets_store.dart';
// * Mobx Codegen Inclusion
part 'individual_session_screen_widgets_coordinator.g.dart';

class IndividualSessionScreenWidgetsCoordinator = _IndividualSessionScreenWidgetsCoordinatorBase
    with _$IndividualSessionScreenWidgetsCoordinator;

abstract class _IndividualSessionScreenWidgetsCoordinatorBase
    extends BasePerspectivesWidgetsStore with Store {
  _IndividualSessionScreenWidgetsCoordinatorBase({
    required super.beachHorizonWater,
    required super.beachSky,
    required super.perspectivesMap,
    required super.collaborativeTextEditor,
    required super.beachWaves,
  });
}
