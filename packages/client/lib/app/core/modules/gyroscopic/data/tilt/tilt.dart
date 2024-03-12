import 'dart:math';
import 'package:sensors_plus/sensors_plus.dart';
import 'package:stream_transform/stream_transform.dart';

class DeviceTilt {
  final int samplingRateMs;
  final Tilt initialTilt;
  final double filterGain;
  late final Stream<Tilt> stream;
  late Tilt _tilt;

  DeviceTilt({
    this.samplingRateMs = 20,
    this.initialTilt = const Tilt(0, 0),
    this.filterGain = 0.1,
    Stream<GyroscopeEvent>? gyroscope,
    Stream<AccelerometerEvent>? accelerometer,
  }) : assert(
          filterGain >= 0 && filterGain <= 1,
          'filterGain must be a valu between 0 and 1, current value is $filterGain',
        ) {
    _tilt = initialTilt;
    final gyroStream = gyroscopeEventStream();
    final accelerometerStream = accelerometerEventStream();
    stream = (gyroStream)
        .combineLatest((accelerometerStream), (p0, p1) => [p0, p1])
        .buffer(Stream.periodic(Duration(milliseconds: samplingRateMs)))
        .map(
      (listOfPairs) {
        final length = listOfPairs.length;

        // average gyroscope and accelerometer events in the given buffer
        var g = GyroscopeEvent(0, 0, 0);
        var a = AccelerometerEvent(0, 0, 0);
        for (var i = 0; i < length; i++) {
          g += listOfPairs[i][0] as GyroscopeEvent;
          a += listOfPairs[i][1] as AccelerometerEvent;
        }
        g = g / length;
        a = a / length;

        // tilt from gyroscope
        final x = _tilt.xRadian + g.x / (1000 / samplingRateMs);
        final y = _tilt.yRadian + g.y / (1000 / samplingRateMs);

        // tilt from accelerometer
        final roll = atan2(a.y, a.z);
        final pitch = atan2(-a.x, a.z);

        // complemetary filtered tilt
        _tilt = Tilt(
          x * (1 - filterGain) + roll * filterGain,
          y * (1 - filterGain) + pitch * filterGain,
        );
        return _tilt;
      },
    );
  }
}

class Tilt {
  final double xRadian;
  final double yRadian;
  const Tilt(this.xRadian, this.yRadian);
  double get xDegrees => xRadian * 180 / pi;
  double get yDegrees => yRadian * 180 / pi;

  @override
  String toString() => 'Tilt:\nx: $xDegrees\ny: $yDegrees';
}

extension on GyroscopeEvent {
  GyroscopeEvent operator +(GyroscopeEvent other) {
    return GyroscopeEvent(x + other.x, y + other.y, z + other.z);
  }

  GyroscopeEvent operator /(int divider) {
    return GyroscopeEvent(x / divider, y / divider, z / divider);
  }
}

extension on AccelerometerEvent {
  AccelerometerEvent operator +(AccelerometerEvent other) {
    return AccelerometerEvent(x + other.x, y + other.y, z + other.z);
  }

  AccelerometerEvent operator /(int divider) {
    return AccelerometerEvent(x / divider, y / divider, z / divider);
  }
}
