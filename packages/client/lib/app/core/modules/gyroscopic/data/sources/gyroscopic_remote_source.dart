import 'dart:async';
import 'package:flutter_compass/flutter_compass.dart';
import 'package:primala/app/core/modules/gyroscopic/utils/utils.dart';

abstract class GyroscopicRemoteSource {
  Stream<int> getDirectionAngle();
  void setReferenceAngle(int newReferenceAngle);
}

class GyroscopicRemoteSourceImpl implements GyroscopicRemoteSource {
  int referenceAngle = -1;
  final StreamController<int> _controller = StreamController<int>();

  GyroscopicRemoteSourceImpl() {
    _initializeCompassStream();
  }

  @override
  Stream<int> getDirectionAngle() {
    return _controller.stream.distinct();
  }

  @override
  void setReferenceAngle(int relativeReferenceAngle) {
    referenceAngle = GyroscopeUtils.setReferenceAngle(
        relativeReferenceAngle, referenceAngle);
    _controller.sink.add(referenceAngle);
  }

  void _initializeCompassStream() {
    FlutterCompass.events?.listen((event) {
      final currentHeading = event.heading!.floor();

      if (referenceAngle == -1) {
        referenceAngle = currentHeading;
      }

      final offset = currentHeading - referenceAngle;
      final shiftedValue = (offset < 0) ? 360 + offset : offset;
      _controller.sink.add(shiftedValue);
    });
  }

  void dispose() {
    _controller.close();
  }
}
