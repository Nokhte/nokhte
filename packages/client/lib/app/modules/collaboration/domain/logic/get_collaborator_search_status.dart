import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

class GetCollaboratorSearchStatus
    extends AbstractFutureLogic<Stream<bool>, NoParams> {
  final CollaborationContract contract;
  GetCollaboratorSearchStatus({required this.contract});

  @override
  call(NoParams params) async =>
      await contract.getCollaboratorSearchStatus(params);
}
