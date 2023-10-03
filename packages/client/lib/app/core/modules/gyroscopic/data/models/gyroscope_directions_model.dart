import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';

class GyroscopeEventsModel extends GyroscopeDirectionsEntity {
  const GyroscopeEventsModel({
    required super.pitch,
    required super.roll,
    required super.yaw,
  });
}
