import 'package:equatable/equatable.dart';
import 'package:primala/app/core/modules/gyroscopic/types/types.dart';

class GyroSetupReturnType extends Equatable {
  final List<QuadrantInfo> quadrantInfo;
  final int maxAngle;
  final int desiredStartingAngle;
  final int startingRevolution;
  const GyroSetupReturnType({
    required this.quadrantInfo,
    required this.maxAngle,
    required this.desiredStartingAngle,
    required this.startingRevolution,
  });
  @override
  List<Object> get props => [
        quadrantInfo,
        maxAngle,
        desiredStartingAngle,
        startingRevolution,
      ];
}
