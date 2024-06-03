import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';

abstract class GyroscopicContract {
  Stream<PhoneHoldingState> getTiltStream(NoParams params);
  Future<bool> checkIfDeviceHasGyroscope(NoParams params);
}
