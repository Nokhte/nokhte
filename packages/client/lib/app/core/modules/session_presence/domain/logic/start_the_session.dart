import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';

class StartTheSession implements AbstractFutureLogic<bool, NoParams> {
  final SessionPresenceContract contract;

  StartTheSession({required this.contract});

  @override
  call(params) async => await contract.startTheSession(params);
}
