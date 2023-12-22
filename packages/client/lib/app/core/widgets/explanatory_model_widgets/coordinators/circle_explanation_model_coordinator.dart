// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';
part 'circle_explanation_model_coordinator.g.dart';

class CircleExplanationModelCoordinator = _CircleExplanationModelCoordinatorBase
    with _$CircleExplanationModelCoordinator;

abstract class _CircleExplanationModelCoordinatorBase extends Equatable
    with Store {
  final GradientCircleStore userCircle;
  final GradientCircleStore collaboratorCircle;
  final AccompanyingTextStore userAccompanyingText;
  final AccompanyingTextStore collaboratorAccompanyingText;

  _CircleExplanationModelCoordinatorBase({
    required this.collaboratorCircle,
    required this.collaboratorAccompanyingText,
    required this.userCircle,
    required this.userAccompanyingText,
  });

  @override
  List<Object> get props => [];
}
