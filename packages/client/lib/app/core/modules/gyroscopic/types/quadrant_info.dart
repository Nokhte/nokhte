import 'package:equatable/equatable.dart';

class QuadrantInfo extends Equatable {
  final int startingAngle;
  final int endingAngle;
  const QuadrantInfo({
    required this.startingAngle,
    required this.endingAngle,
  });

  @override
  List<Object> get props => [startingAngle, endingAngle];
}
