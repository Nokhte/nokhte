import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

class UpdateTimerRunningStatus
    implements AbstractFutureLogic<TimerRunningUpdateStatusEntity, bool> {
  final TimerContract contract;

  UpdateTimerRunningStatus({required this.contract});

  @override
  call(params) async => await contract.updateTimerRunningStatus(params);
}
