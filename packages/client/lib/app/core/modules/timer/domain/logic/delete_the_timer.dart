import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

class DeleteTheTimer
    implements AbstractFutureLogic<TimerDeletionStatusEntity, NoParams> {
  final TimerContract contract;

  DeleteTheTimer({required this.contract});

  @override
  call(params) async => await contract.deleteTheTimer(params);
}
