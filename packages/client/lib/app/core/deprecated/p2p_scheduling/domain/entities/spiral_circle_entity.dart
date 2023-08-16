import 'package:equatable/equatable.dart';
import 'package:primala/app/core/deprecated/p2p_scheduling/constants/touch_types.dart';

class SpiralCircleEntity extends Equatable {
  final TouchTypes touchType;
  final String hrTime;

  const SpiralCircleEntity({
    required this.touchType,
    required this.hrTime,
  });

  @override
  List<Object> get props => [];
}
