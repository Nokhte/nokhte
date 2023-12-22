// make a mobx store based on the name of the file

// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
part 'circle_explanation_widgets_coordinator.g.dart';

class CircleExplanationWidgetsCoordinator = _CircleExplanationWidgetsCoordinatorBase
    with _$CircleExplanationWidgetsCoordinator;

abstract class _CircleExplanationWidgetsCoordinatorBase extends Equatable
    with Store {
  @override
  List<Object> get props => [];
}
