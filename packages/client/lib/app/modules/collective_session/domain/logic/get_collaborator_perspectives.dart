import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collective_session/domain/domain.dart';

class GetCollaboratorPerspectives
    implements AbstractFutureLogic<CollaboratorPerspectivesEntity, NoParams> {
  final CollectiveSessionContract contract;

  GetCollaboratorPerspectives({required this.contract});

  @override
  call(params) async => await contract.getCollaboratorPerspectives(params);
}
