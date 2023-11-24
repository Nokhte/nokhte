import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/update_existing_collaborations/domain/domain.dart';

class ConsecrateTheCollaboration
    implements
        AbstractFutureLogic<CollaborationConsecrationStatusEntity, NoParams> {
  final UpdateExistingCollaborationsContract contract;

  ConsecrateTheCollaboration({required this.contract});

  @override
  call(params) async => await contract.consecrateTheCollaboration(params);
}
