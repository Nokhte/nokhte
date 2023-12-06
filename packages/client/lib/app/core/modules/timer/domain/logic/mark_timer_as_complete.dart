import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

class MarkTimerAsComplete
    implements AbstractFutureLogic<TimerCompletionStatusEntity, NoParams> {
  final TimerContract contract;

  MarkTimerAsComplete({required this.contract});

  @override
  call(params) async => await contract.markTimerAsComplete(params);
}
