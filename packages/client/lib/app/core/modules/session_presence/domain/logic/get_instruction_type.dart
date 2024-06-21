import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';

class GetInstructionType
    implements AbstractFutureLogic<SessionInstructionTypes, String> {
  final SessionPresenceContract contract;

  GetInstructionType({required this.contract});

  @override
  call(params) async => await contract.getInstructionType(params);
}
