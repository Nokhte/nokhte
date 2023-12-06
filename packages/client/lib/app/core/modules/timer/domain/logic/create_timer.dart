import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

class CreateTimer
    implements
        AbstractFutureLogic<TimerCreationStatusEntity, CreateTimerParams> {
  final TimerContract contract;

  CreateTimer({required this.contract});

  @override
  call(params) async => await contract.createTimer(params);
}

class CreateTimerParams extends Equatable {
  final double timerLengthInMinutes;
  static const double sixtyThousand = 60000;

  const CreateTimerParams({required this.timerLengthInMinutes});

  double toMilliseconds() => timerLengthInMinutes * sixtyThousand;

  @override
  List<Object> get props => [timerLengthInMinutes];
}
