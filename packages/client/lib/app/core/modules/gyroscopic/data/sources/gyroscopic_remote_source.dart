// import 'package:sensors_plus/sensors_plus.dart';
import 'package:flutter_compass/flutter_compass.dart';

abstract class GyroscopicRemoteSource {
  Stream<int> getDirectionAngle();
}

class GyroscopicRemoteSourceImpl implements GyroscopicRemoteSource {
  @override
  Stream<int> getDirectionAngle() {
    return _transformedCompassStream();
  }

  Stream<int> _transformedCompassStream() async* {
    int firstValue = -1; // Initialize with a default value

    if (FlutterCompass.events == null) {
      yield -1;
    } else {
      await for (final event in FlutterCompass.events ??
          Stream.value(
            CompassEvent.fromList([-1.0, 0.0, 0.0]),
          )) {
        final currentHeading = event.heading!.floor();

        if (firstValue == -1) {
          // Set the first value
          firstValue = currentHeading;
        }

        final offset = currentHeading - firstValue;
        final shiftedValue = (offset < 0) ? 360 + offset : offset;
        yield shiftedValue;
      }
    }
  }
}
