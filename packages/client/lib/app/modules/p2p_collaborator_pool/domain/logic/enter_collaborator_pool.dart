import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/contracts/p2p_collaborator_pool_contract.dart';
import 'package:nokhte/app/modules/p2p_collaborator_pool/domain/entities/entities.dart';
import 'package:nokhte_backend/phrase_components.dart';

class EnterCollaboratorPool extends AbstractFutureLogic<
    CollaboratorPoolEntryStatusEntity, CollaboratorPhraseIDs> {
  final P2PCollaboratorPoolContract contract;

  EnterCollaboratorPool({required this.contract});

  @override
  call(params) async =>
      await contract.enterTheCollaboratorPool(phraseIDs: params);
}
