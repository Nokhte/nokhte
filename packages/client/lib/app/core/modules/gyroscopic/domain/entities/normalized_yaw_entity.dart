import 'package:equatable/equatable.dart';

class NormalizedYawEntity extends Equatable {
  final double yaw;

  const NormalizedYawEntity({
    required this.yaw,
  });

  @override
  List<Object> get props => [
        yaw,
      ];
}
