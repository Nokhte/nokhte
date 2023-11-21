import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/one_talker_at_a_time/domain/domain.dart';

class UpdateWhoIsTalking
    implements
        AbstractFutureLogic<WhoIsTalkingUpdateStatusEntity,
            WhoIsTalkingUpdateParams> {
  final OneTalkerAtATimeContract contract;

  UpdateWhoIsTalking({required this.contract});

  @override
  call(params) async => await contract.updateWhoIsTalking(params);
}

enum WhoIsTalkingUpdateParams {
  clearOut,
  setUserAsTalker,
}
