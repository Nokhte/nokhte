import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/session_starters/session_starters.dart';

class ExitCollaboratorPool extends AbstractFutureLogic<bool, NoParams> {
  final SessionStartersContract contract;

  ExitCollaboratorPool({required this.contract});

  @override
  call(params) async => await contract.exitCollaboratorPool(params);
}
