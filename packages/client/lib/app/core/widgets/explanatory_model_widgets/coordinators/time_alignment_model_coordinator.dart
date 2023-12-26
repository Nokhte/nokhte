// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'time_alignment_model_coordinator.g.dart';

class TimeAlignmentModelCoordinator = _TimeAlignmentModelCoordinatorBase
    with _$TimeAlignmentModelCoordinator;

abstract class _TimeAlignmentModelCoordinatorBase extends Equatable with Store {
  final ClockFaceStore clockFace;
  final AccompanyingTextStore accompanyingText;
  final GradientCircleStore userCircle;
  final GradientCircleStore collaboratorCircle;
  final AvailabilitySectorsStore availabilitySectors;

  _TimeAlignmentModelCoordinatorBase({
    required this.clockFace,
    required this.accompanyingText,
    required this.userCircle,
    required this.collaboratorCircle,
    required this.availabilitySectors,
  });

  @action
  init() {
    clockFace.setControl(Control.playFromStart);
    availabilitySectors.setControl(Control.playFromStart);
  }

  @override
  List<Object> get props => [];
}
