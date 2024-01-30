// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/nokhte_session/presentation/presentation.dart';
part 'nokhte_session_phase0_coordinator.g.dart';

class NokhteSessionPhase0Coordinator = _NokhteSessionPhase0CoordinatorBase
    with _$NokhteSessionPhase0Coordinator;

abstract class _NokhteSessionPhase0CoordinatorBase extends BaseCoordinator
    with Store {
  final NokhteSessionPhase0WidgetsCoordinator widgets;

  _NokhteSessionPhase0CoordinatorBase({
    required this.widgets,
  });

  @action
  constructor() {
    widgets.constructor();
  }

  @action
  onInactive() => widgets.onInactive();

  @action
  onResumed() => widgets.onResumed();
}
