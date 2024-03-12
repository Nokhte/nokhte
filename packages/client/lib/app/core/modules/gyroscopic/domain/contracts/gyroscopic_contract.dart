import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/types/types.dart';

abstract class GyroscopicContract {
  Stream<PhoneHoldingState> getTiltStream(NoParams params);
}
