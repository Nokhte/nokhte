import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';

class UpdateCurrentPhase implements AbstractFutureLogic<bool, double> {
  final SessionPresenceContract contract;

  UpdateCurrentPhase({required this.contract});

  @override
  call(params) async => await contract.updateCurrentPhase(params);
}
