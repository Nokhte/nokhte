import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/existing_collaborations/domain/domain.dart';

class ConsecrateTheCollaboration
    implements
        AbstractFutureLogic<CollaborationConsecrationStatusEntity, NoParams> {
  final ExistingCollaborationsContract contract;

  ConsecrateTheCollaboration({required this.contract});

  @override
  call(params) async => await contract.consecrateTheCollaboration(params);
}
