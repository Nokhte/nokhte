import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/presence_modules/modules/shared/shared.dart';

class UpdateOnlineStatus
    implements AbstractFutureLogic<bool, UpdatePresencePropertyParams> {
  final BasePresenceContract contract;

  UpdateOnlineStatus({required this.contract});

  @override
  call(params) async => await contract.updateOnlineStatus(params);
}
