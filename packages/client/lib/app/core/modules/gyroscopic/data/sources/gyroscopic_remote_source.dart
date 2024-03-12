import 'package:nokhte/app/core/extensions/extensions.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';
import 'package:nokhte/app/core/modules/gyroscopic/data/data.dart';

abstract class GyroscopicRemoteSource {
  Stream<PhoneHoldingState> getTiltStream();
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
}
