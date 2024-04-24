import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';

class UpdateWhoIsTalking
    implements AbstractFutureLogic<bool, UpdateWhoIsTalkingParams> {
  final SessionPresenceContract contract;

  UpdateWhoIsTalking({required this.contract});

  @override
  call(params) async => await contract.updateWhoIsTalking(params);
}

enum UpdateWhoIsTalkingParams {
  clearOut,
  setUserAsTalker,
}
