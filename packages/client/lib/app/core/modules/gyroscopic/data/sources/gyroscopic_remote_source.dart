import 'dart:io';

import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';
import 'package:android_package_manager/android_package_manager.dart';

abstract class GyroscopicRemoteSource {
  Stream<PhoneHoldingState> getTiltStream();
  Future<bool> checkIfDeviceHasGyroscope();
}

class GyroscopicRemoteSourceImpl implements GyroscopicRemoteSource {
  final DeviceTilt tilt;

  GyroscopicRemoteSourceImpl({
    required this.tilt,
  });

  @override
  getTiltStream() => tilt.stream.map(
        (e) => e.xDegrees.isGreaterThan(10)
            ? PhoneHoldingState.isPickedUp
            : PhoneHoldingState.isDown,
      );

  @override
  checkIfDeviceHasGyroscope() async {
    if (Platform.isAndroid) {
      AndroidPackageManager packageManager = AndroidPackageManager();
      return await packageManager.hasSystemFeature(
          featureName: 'FEATURE_SENSOR_GYROSCOPE');
    } else if (Platform.isIOS) {
      return true;
    } else {
      return false;
    }
  }
}
