import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';
import 'package:nokhte_backend/edge_functions/edge_functions.dart';

class EnterCollaboratorPool
    extends AbstractFutureLogic<bool, EnterCollaboratorPoolParams> {
  final SessionStartersContract contract;

  EnterCollaboratorPool({required this.contract});

  @override
  call(params) async => await contract.enterTheCollaboratorPool(params);
}

class EnterCollaboratorPoolParams extends Equatable {
  final String collaboratorUID;
  final InvitationType invitationType;

  const EnterCollaboratorPoolParams({
    required this.collaboratorUID,
    required this.invitationType,
  });

  @override
  List<Object> get props => [collaboratorUID, invitationType];
}
