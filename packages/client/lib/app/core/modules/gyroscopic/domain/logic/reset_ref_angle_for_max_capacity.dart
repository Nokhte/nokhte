import 'package:equatable/equatable.dart';
import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/gyroscopic/domain/domain.dart';

class ResetRefAngleForMaxCapacity
    implements
        AbstractSyncNoFailureLogic<ReferenceAngleSetterStatusEntity,
            ResetRefAngleForMaxCapacityParams> {
  final GyroscopicContract contract;

  ResetRefAngleForMaxCapacity({required this.contract});

  @override
  call(params) => contract.resetRefAngleForMaxCapacity(params);
}

class ResetRefAngleForMaxCapacityParams extends Equatable {
  final int maxAngle;
  final int currentValue;

  const ResetRefAngleForMaxCapacityParams(
      {required this.maxAngle, required this.currentValue});

  @override
  List<Object> get props => [maxAngle, currentValue];
}
