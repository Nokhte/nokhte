import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';

class JoinSession extends AbstractFutureLogic<bool, String> {
  final SessionStartersContract contract;

  JoinSession({required this.contract});

  @override
  call(params) async => await contract.joinSession(params);
}
