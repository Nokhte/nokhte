// import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_compass/flutter_compass.dart';

abstract class GyroscopicRemoteSource {
  Stream<int> getDirectionAngle();
}

class GyroscopicRemoteSourceImpl implements GyroscopicRemoteSource {
  @override
  Stream<int> getDirectionAngle() {
    return FlutterCompass.events
            ?.distinct()
            .map((event) => event.heading!.floor()) ??
        Stream.value(-199);
  }
}
