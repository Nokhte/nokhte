// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'irl_nokhte_session_speaking_instructions_screen_widgets_coordinator.dart';
part 'irl_nokhte_session_speaking_instructions_screen_coordinator.g.dart';

class IrlNokhteSessionSpeakingInstructionsScreenCoordinator = _IrlNokhteSessionSpeakingInstructionsScreenCoordinatorBase
    with _$IrlNokhteSessionSpeakingInstructionsScreenCoordinator;

abstract class _IrlNokhteSessionSpeakingInstructionsScreenCoordinatorBase
    extends BaseCoordinator with Store {
  final HoldDetector hold;
  final SwipeDetector swipe;
  final IrlNokhteSessionSpeakingScreenWidgetsCoordinator widgets;
  _IrlNokhteSessionSpeakingInstructionsScreenCoordinatorBase({
    required super.captureScreen,
    required this.widgets,
    required this.hold,
    required this.swipe,
  });

  @action
  constructor() {
    widgets.constructor();
  }
}
