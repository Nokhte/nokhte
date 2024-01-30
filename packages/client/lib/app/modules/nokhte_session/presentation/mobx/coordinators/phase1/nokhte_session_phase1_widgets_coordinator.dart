// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
part 'nokhte_session_phase1_widgets_coordinator.g.dart';

class NokhteSessionPhase1WidgetsCoordinator = _NokhteSessionPhase1WidgetsCoordinatorBase
    with _$NokhteSessionPhase1WidgetsCoordinator;

abstract class _NokhteSessionPhase1WidgetsCoordinatorBase
    extends BaseWidgetsCoordinator with Store {}
