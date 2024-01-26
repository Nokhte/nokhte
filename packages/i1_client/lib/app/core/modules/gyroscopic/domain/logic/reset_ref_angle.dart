import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/gyroscopic/domain/domain.dart';

class ResetRefAngle
    implements
        AbstractSyncNoFailureLogic<ReferenceAngleSetterStatusEntity,
            ResetRefAngleParams> {
  final GyroscopicContract contract;

  ResetRefAngle({required this.contract});

  @override
  call(params) => contract.resetRefAngle(params);
}

class ResetRefAngleParams extends Equatable {
  final int desiredSetAngle;
  final int currentValue;

  const ResetRefAngleParams(
      {required this.desiredSetAngle, required this.currentValue});

  @override
  List<Object> get props => [desiredSetAngle, currentValue];
}
