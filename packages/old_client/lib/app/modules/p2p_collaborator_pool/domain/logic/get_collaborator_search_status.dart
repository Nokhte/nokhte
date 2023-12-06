import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/domain.dart';

class GetCollaboratorSearchStatus
    extends AbstractFutureLogic<CollaboratorSearchStatusEntity, NoParams> {
  final P2PCollaboratorPoolContract contract;
  GetCollaboratorSearchStatus({required this.contract});

  @override
  call(NoParams params) async => await contract.getCollaboratorSearchStatus();
}
