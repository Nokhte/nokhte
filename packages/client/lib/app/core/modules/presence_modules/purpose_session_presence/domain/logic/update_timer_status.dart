import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/presence_modules/presence_modules.dart';

class UpdateTimerStatus implements AbstractFutureLogic<bool, bool> {
  final PurposeSessionPresenceContract contract;

  UpdateTimerStatus({required this.contract});

  @override
  call(params) async => await contract.updateTimerStatus(params);
}
