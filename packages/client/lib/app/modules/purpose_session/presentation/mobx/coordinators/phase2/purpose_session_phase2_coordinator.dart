// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/mobx.dart';
import 'purpose_session_phase2_widgets_coordinator.dart';
part 'purpose_session_phase2_coordinator.g.dart';

class PurposeSessionPhase2Coordinator = _PurposeSessionPhase2CoordinatorBase
    with _$PurposeSessionPhase2Coordinator;

abstract class _PurposeSessionPhase2CoordinatorBase
    extends BaseWidgetsCoordinator with Store {
  final PurposeSessionPhase2WidgetsCoordinator widgets;

  _PurposeSessionPhase2CoordinatorBase({
    required this.widgets,
  });
}
