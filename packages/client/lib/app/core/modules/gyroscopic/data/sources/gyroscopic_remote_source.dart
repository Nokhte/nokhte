import 'package:sensors_plus/sensors_plus.dart';

abstract class GyroscopicRemoteSource {
  Stream<GyroscopeEvent> fetchRawDirections();
}

class GyroscopicRemoteSourceImpl implements GyroscopicRemoteSource {
  @override
  Stream<GyroscopeEvent> fetchRawDirections() {
    return gyroscopeEvents;
  }
}
