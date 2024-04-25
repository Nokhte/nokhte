import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/session_presence/session_presence.dart';

class UpdateOnlineStatus
    implements AbstractFutureLogic<bool, UpdatePresencePropertyParams> {
  final SessionPresenceContract contract;

  UpdateOnlineStatus({required this.contract});

  @override
  call(params) async => await contract.updateOnlineStatus(params);
}
