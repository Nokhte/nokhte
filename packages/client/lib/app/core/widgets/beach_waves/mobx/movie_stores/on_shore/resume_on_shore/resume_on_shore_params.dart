import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/widgets/widgets.dart';

class ResumeOnShoreParams extends Equatable {
  final double position;
  final WaterDirection direction;
  const ResumeOnShoreParams({
    this.position = -10,
    this.direction = WaterDirection.down,
  });

  factory ResumeOnShoreParams.initial() => const ResumeOnShoreParams(
        direction: WaterDirection.down,
        position: -10.0,
      );

  @override
  List<Object> get props => [position, direction];
}
