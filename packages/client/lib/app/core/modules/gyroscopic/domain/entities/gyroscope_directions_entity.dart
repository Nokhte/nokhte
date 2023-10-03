import 'package:equatable/equatable.dart';

class GyroscopeDirectionsEntity extends Equatable {
  final double pitch;

  ///^^  x axis, corresponds to the top of the device, if it's facing up positive
  ///^^  pitch, if it's facing down negative pitch
  final double roll; // y axis
  /// ^^ y axis, corresponds to sides, for example w/ screen facing you if you
  /// ^^ turn the phone clockwise, positive role, counter-clockwise, negative roll
  final double yaw;

  /// ^^ z axis, corresponds to the direction, think of this as the compass,
  /// ^^ clockwise introduces positive yaw, counter-clockwise, negative yaw

  const GyroscopeDirectionsEntity({
    required this.pitch,
    required this.roll,
    required this.yaw,
  });

  @override
  List<Object> get props => [
        pitch,
        roll,
        yaw,
      ];
}
