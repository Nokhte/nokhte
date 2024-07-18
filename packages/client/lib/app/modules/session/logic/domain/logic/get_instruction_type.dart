import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session/session.dart';

class GetInstructionType
    implements AbstractFutureLogic<SessionInstructionTypes, String> {
  final SessionPresenceContract contract;

  GetInstructionType({required this.contract});

  @override
  call(params) async => await contract.getInstructionType(params);
}
