// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
import 'package:simple_animations/simple_animations.dart';
part 'time_alignment_model_coordinator.g.dart';

class TimeAlignmentModelCoordinator = _TimeAlignmentModelCoordinatorBase
    with _$TimeAlignmentModelCoordinator;

abstract class _TimeAlignmentModelCoordinatorBase extends Equatable with Store {
  final ClockFaceStore clockFace;
  final AvailabilitySectorsStore availabilitySectors;

  _TimeAlignmentModelCoordinatorBase({
    required this.clockFace,
    required this.availabilitySectors,
  });

  @action
  init() {
    clockFace.initMovie(NoParams());
    availabilitySectors.initMovie(NoParams());
  }

  @action
  reverseClockFaceMovie() {
    clockFace.setControl(Control.playReverseFromEnd);
  }

  @override
  List<Object> get props => [];
}
