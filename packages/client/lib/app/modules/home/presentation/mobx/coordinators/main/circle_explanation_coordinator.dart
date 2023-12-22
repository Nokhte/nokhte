// ignore_for_file: must_be_immutable, library_private_types_in_public_api
import 'package:mobx/mobx.dart';
import 'package:equatable/equatable.dart';
part 'circle_explanation_coordinator.g.dart';

class CircleExplanationCoordinator = _CircleExplanationCoordinatorBase
    with _$CircleExplanationCoordinator;

abstract class _CircleExplanationCoordinatorBase extends Equatable with Store {
  @override
  List<Object> get props => [];
}
