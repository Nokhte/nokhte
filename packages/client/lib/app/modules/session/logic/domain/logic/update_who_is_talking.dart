import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session/session.dart';

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
