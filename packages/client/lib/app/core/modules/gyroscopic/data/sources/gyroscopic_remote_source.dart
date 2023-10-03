// import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_compass/flutter_compass.dart';

abstract class GyroscopicRemoteSource {
  Stream<CompassEvent> fetchRawDirections();
}

class GyroscopicRemoteSourceImpl implements GyroscopicRemoteSource {
  @override
  Stream<CompassEvent> fetchRawDirections() {
    return FlutterCompass.events ?? Stream.value(CompassEvent.fromList([0]));
  }
}
