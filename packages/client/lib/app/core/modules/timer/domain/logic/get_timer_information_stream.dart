import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

class GetTimerInformationStream
    implements AbstractFutureLogic<TimerInformationStreamEntity, NoParams> {
  final TimerContract contract;

  GetTimerInformationStream({required this.contract});

  @override
  call(params) async => await contract.getTimerInformationStream(params);
}
