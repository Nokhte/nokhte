import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/gyroscopic.dart';

class GetTiltStream
    implements AbstractNoFailureStreamLogic<PhoneHoldingState, NoParams> {
  final GyroscopicContract contract;

  GetTiltStream({required this.contract});

  @override
  call(params) => contract.getTiltStream(params);
}
