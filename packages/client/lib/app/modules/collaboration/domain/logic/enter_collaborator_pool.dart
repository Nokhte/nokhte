import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';

class EnterCollaboratorPool
    extends AbstractFutureLogic<CollaboratorPoolEntryStatusEntity, String> {
  final CollaborationContract contract;

  EnterCollaboratorPool({required this.contract});

  @override
  call(params) async => await contract.enterTheCollaboratorPool(params);
}
