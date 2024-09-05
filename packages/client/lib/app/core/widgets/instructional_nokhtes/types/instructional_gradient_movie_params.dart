import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class InstructionalGradientMovieParams extends Equatable {
  final InstructionalNokhtePositions position;
  final GradientNokhteColorways colorway;
  final InstructionalGradientDirections direction;

  const InstructionalGradientMovieParams({
    required this.colorway,
    required this.direction,
    required this.position,
  });

  @override
  List<Object> get props => [position, colorway, direction];
}
