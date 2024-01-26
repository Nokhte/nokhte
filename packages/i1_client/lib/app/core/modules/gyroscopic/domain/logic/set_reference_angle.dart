import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';

class SetReferenceAngle
    implements
        AbstractSyncNoFailureLogic<ReferenceAngleSetterStatusEntity, int> {
  final GyroscopicContract contract;

  SetReferenceAngle({required this.contract});

  @override
  call(params) => contract.setReferenceAngle(params);
}
