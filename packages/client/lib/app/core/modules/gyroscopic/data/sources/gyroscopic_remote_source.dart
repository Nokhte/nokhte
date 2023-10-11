// import 'package:flutter_compass/flutter_compass.dart';

// abstract class GyroscopicRemoteSource {
//   Stream<int> getDirectionAngle();
// }

// class GyroscopicRemoteSourceImpl implements GyroscopicRemoteSource {
//   @override
//   Stream<int> getDirectionAngle() {
//     return _transformedCompassStream();
//   }

//   Stream<int> _transformedCompassStream() async* {
//     int referenceAngle = -1; // Initialize with a default value

//     if (FlutterCompass.events == null) {
//       yield -1;
//     } else {
//       await for (final event in FlutterCompass.events ??
//           Stream.value(
//             CompassEvent.fromList([-1.0, 0.0, 0.0]),
//           )) {
//         final currentHeading = event.heading!.floor();

//         if (referenceAngle == -1) {
//           // Set the first value
//           referenceAngle = currentHeading;
//         }

//         final offset = currentHeading - referenceAngle;
//         final shiftedValue = (offset < 0) ? 360 + offset : offset;
//         yield shiftedValue;
//       }
//     }
//   }
// }

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

  // @override
  // void setReferenceAngle(int newReferenceAngle) {
  //   final offset = (newReferenceAngle - referenceAngle) % 360;
  //   referenceAngle = offset;
  //   print("What's the new ref angle? $referenceAngle");
  //   _controller.sink.add(referenceAngle);
  // }

  @override
  void setReferenceAngle(int relativeReferenceAngle) {
    print("$relativeReferenceAngle $referenceAngle");
    referenceAngle = GyroscopeUtils.setReferenceAngle(
        relativeReferenceAngle, referenceAngle);

    _controller.sink.add(referenceAngle);
    print("What's the new ref angle? $referenceAngle");
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
