// import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_compass/flutter_compass.dart';

abstract class GyroscopicRemoteSource {
  Stream<CompassEvent> getDirectionAngle();
}

class GyroscopicRemoteSourceImpl implements GyroscopicRemoteSource {
  @override
  Stream<CompassEvent> getDirectionAngle() {
    return FlutterCompass.events ??
        Stream.value(CompassEvent.fromList([-199, 0, 0]));
  }
}
