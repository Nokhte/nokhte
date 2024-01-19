// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/mobx/base_coordinator.dart';
part 'purpose_session_phase3_coordinator.g.dart';

class PurposeSessionPhase3Coordinator = _PurposeSessionPhase3CoordinatorBase
    with _$PurposeSessionPhase3Coordinator;

abstract class _PurposeSessionPhase3CoordinatorBase extends BaseCoordinator
    with Store {}
