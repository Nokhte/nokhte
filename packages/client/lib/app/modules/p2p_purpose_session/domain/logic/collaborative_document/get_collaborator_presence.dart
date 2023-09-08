import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/domain.dart';

class GetCollaboratorPresence extends AbstractFutureLogic<
    CollaborativeDocCollaboratorPresenceEntity, NoParams> {
  final P2PPurposeSessionCollaborativeDocContract contract;

  GetCollaboratorPresence({
    required this.contract,
  });

  @override
  call(NoParams params) async => await contract.getCollaboratorPresence();
}
