import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class AuxiliaryNokheMovieParams extends Equatable {
  final AuxiliaryNokhtePositions position;
  final AuxiliaryNokhteColorways colorway;
  final NokhteScaleState direction;

  const AuxiliaryNokheMovieParams({
    required this.colorway,
    required this.direction,
    required this.position,
  });

  @override
  List<Object> get props => [position, colorway, direction];
}
