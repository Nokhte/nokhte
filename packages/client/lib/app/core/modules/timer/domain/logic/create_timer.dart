import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

class CreateTimer
    implements AbstractFutureLogic<TimerCreationStatusEntity, NoParams> {
  final TimerContract contract;

  CreateTimer({required this.contract});

  @override
  call(params) async => await contract.createTimer(params);
}
