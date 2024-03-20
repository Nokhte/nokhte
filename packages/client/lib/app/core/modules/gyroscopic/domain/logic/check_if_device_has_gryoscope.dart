import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';

class CheckIfDeviceHasGyroscope
    implements AbstractNoFailureAsyncLogic<bool, NoParams> {
  final GyroscopicContract contract;

  CheckIfDeviceHasGyroscope({required this.contract});

  @override
  call(params) async => await contract.checkIfDeviceHasGyroscope(params);
}
