import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/contracts/p2p_collaborator_pool_contract.dart';
import 'package:primala/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';

class CancelCollaboratorStream
    extends AbstractFutureLogic<CollaboratorStreamStatusEntity, NoParams> {
  final P2PCollaboratorPoolContract contract;

  CancelCollaboratorStream({
    required this.contract,
  });

  @override
  call(params) async => await contract.cancelCollaboratorStream();
}
