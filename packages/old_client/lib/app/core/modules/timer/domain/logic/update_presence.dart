import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

class UpdatePresence
    implements AbstractFutureLogic<PresenceUpdateStatusEntity, bool> {
  final TimerContract contract;

  UpdatePresence({required this.contract});

  @override
  call(params) async => await contract.updatePresence(params);
}
