import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/presence_modules/modules/shared/shared.dart';

class UpdateWhoIsTalking
    implements AbstractFutureLogic<bool, UpdateWhoIsTalkingParams> {
  final BasePresenceContract contract;

  UpdateWhoIsTalking({required this.contract});

  @override
  call(params) async => await contract.updateWhoIsTalking(params);
}

enum UpdateWhoIsTalkingParams {
  clearOut,
  setUserAsTalker,
}
