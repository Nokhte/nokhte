// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'package:nokhte/app/core/modules/posthog/constants/constants.dart';
import 'package:nokhte/app/core/modules/posthog/domain/domain.dart';
import 'package:nokhte/app/modules/legacy_virtual_nokhte_session/presentation/presentation.dart';
part 'legacy_virtual_nokhte_session_phase0_coordinator.g.dart';

class LegacyVirtualNokhteSessionPhase0Coordinator = _LegacyVirtualNokhteSessionPhase0CoordinatorBase
    with _$LegacyVirtualNokhteSessionPhase0Coordinator;

abstract class _LegacyVirtualNokhteSessionPhase0CoordinatorBase
    extends BaseCoordinator with Store {
  final LegacyVirtualNokhteSessionPhase0WidgetsCoordinator widgets;
  final CaptureNokhteSessionStart captureNokhteSessionStart;

  _LegacyVirtualNokhteSessionPhase0CoordinatorBase({
    required this.widgets,
    required this.captureNokhteSessionStart,
    required super.captureScreen,
  });

  @action
  constructor() async {
    widgets.constructor();
    await captureNokhteSessionStart(NoParams());
    await captureScreen(Screens.nokhteSessionPhase0);
  }

  @action
  onInactive() => widgets.onInactive();

  @action
  onResumed() => widgets.onResumed();
}
