import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class UpdateOnlineStatus
    implements AbstractFutureLogic<bool, UpdatePresencePropertyParams> {
  final CollaboratorPresenceContract contract;

  UpdateOnlineStatus({required this.contract});

  @override
  call(params) async => await contract.updateOnlineStatus(params);
}
