import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

class GetSessionMetadata
    implements
        AbstractFutureLogic<Stream<CollaborationSessionMetadata>, NoParams> {
  final CollaboratorPresenceContract contract;

  GetSessionMetadata({required this.contract});

  @override
  call(params) async => await contract.getSessionMetadata(params);
}
