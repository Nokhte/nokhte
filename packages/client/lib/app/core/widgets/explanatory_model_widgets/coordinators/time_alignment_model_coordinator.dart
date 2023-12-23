// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'time_alignment_model_coordinator.g.dart';

class TimeAlignmentModelCoordinator = _TimeAlignmentModelCoordinatorBase
    with _$TimeAlignmentModelCoordinator;

abstract class _TimeAlignmentModelCoordinatorBase extends Equatable with Store {
  final ClockFaceStore clockFace;
  final AccompanyingTextStore primaryAccompanyingText;
  final AccompanyingTextStore secondaryAccompanyingText;
  final GradientCircleStore userGradientCircle;
  final GradientCircleStore collaboratorGradientCircle;
  final AvailabilitySectorsStore availabilitySectors;

  _TimeAlignmentModelCoordinatorBase({
    required this.clockFace,
    required this.primaryAccompanyingText,
    required this.secondaryAccompanyingText,
    required this.userGradientCircle,
    required this.collaboratorGradientCircle,
    required this.availabilitySectors,
  });

  @override
  List<Object> get props => [];
}
