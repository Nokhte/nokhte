import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/contracts/p2p_collaborator_pool_contract.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class ExitCollaboratorPool
    extends AbstractFutureLogic<CollaboratorPoolExitStatusEntity, NoParams> {
  final P2PCollaboratorPoolContract contract;

  ExitCollaboratorPool({required this.contract});

  @override
  call(params) async => await contract.exitCollaboratorPool();
}
