// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/modules/purpose_session/presentation/presentation.dart';
part 'purpose_session_phase_zero_coordinator.g.dart';

class PurposeSessionPhaseZeroCoordinator = _PurposeSessionPhaseZeroCoordinatorBase
    with _$PurposeSessionPhaseZeroCoordinator;

abstract class _PurposeSessionPhaseZeroCoordinatorBase extends BaseCoordinator
    with Store {
  final PurposeSessionPhaseZeroWidgetsCoordinator widgets;

  _PurposeSessionPhaseZeroCoordinatorBase({
    required this.widgets,
  });

  @action
  constructor() => widgets.constructor();

  @action
  onInactive() => widgets.onInactive();

  @action
  onResumed() => widgets.onResumed();
}
