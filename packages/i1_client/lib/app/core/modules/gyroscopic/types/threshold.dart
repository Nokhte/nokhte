import 'package:equatable/equatable.dart';
import 'closer_to.dart';

class Threshold extends Equatable {
  final bool isInRange;
  final CloserTo closerTo;
  final int angle;

  const Threshold({
    required this.isInRange,
    required this.closerTo,
    required this.angle,
  });

  @override
  List<Object> get props => [isInRange, closerTo, angle];
}
