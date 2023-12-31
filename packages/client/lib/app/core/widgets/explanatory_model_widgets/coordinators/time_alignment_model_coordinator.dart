// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/mobx/base_custom_animated_widget_store.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'time_alignment_model_coordinator.g.dart';

class TimeAlignmentModelCoordinator = _TimeAlignmentModelCoordinatorBase
    with _$TimeAlignmentModelCoordinator;

abstract class _TimeAlignmentModelCoordinatorBase
    extends BaseCustomAnimatedWidgetStore with Store {
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
  reverseClockFaceMovie() => clockFace.reverse();

  @override
  List<Object> get props => [];
}
