import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class UpdateOnCallStatus
    implements AbstractFutureLogic<bool, UpdatePresencePropertyParams> {
  final CollaboratorPresenceContract contract;

  UpdateOnCallStatus({required this.contract});

  @override
  call(params) async => await contract.updateOnCallStatus(params);
}
