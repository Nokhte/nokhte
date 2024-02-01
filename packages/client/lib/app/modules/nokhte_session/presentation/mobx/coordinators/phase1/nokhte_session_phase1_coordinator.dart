// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';
import 'nokhte_session_phase1_widgets_coordinator.dart';
part 'nokhte_session_phase1_coordinator.g.dart';

class NokhteSessionPhase1Coordinator = _NokhteSessionPhase1CoordinatorBase
    with _$NokhteSessionPhase1Coordinator;

abstract class _NokhteSessionPhase1CoordinatorBase extends BaseCoordinator
    with Store {
  final NokhteSessionPhase1WidgetsCoordinator widgets;
  final NokhteSessionPresenceCoordinator presence;

  _NokhteSessionPhase1CoordinatorBase({
    required this.widgets,
    required this.presence,
  });
}
