// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/presentation.dart';
part 'purpose_session_phase0_coordinator.g.dart';

class PurposeSessionPhase0Coordinator = _PurposeSessionPhase0CoordinatorBase
    with _$PurposeSessionPhase0Coordinator;

abstract class _PurposeSessionPhase0CoordinatorBase extends BaseCoordinator
    with Store {
  final PurposeSessionPhase0WidgetsCoordinator widgets;

  _PurposeSessionPhase0CoordinatorBase({
    required this.widgets,
  });

  @action
  constructor() => widgets.constructor();

  @action
  onInactive() => widgets.onInactive();

  @action
  onResumed() => widgets.onResumed();
}
