import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';

class CheckIfHasDoneSession implements AbstractFutureLogic<bool, NoParams> {
  final SessionPresenceContract contract;

  CheckIfHasDoneSession({required this.contract});

  @override
  call(params) async => await contract.checkIfHasDoneSession(params);
}
