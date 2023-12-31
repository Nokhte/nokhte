import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

class GetCollaborativeDocContent
    extends AbstractFutureLogic<CollaborativeDocContentEntity, NoParams> {
  final CollaborativeDocContract contract;

  GetCollaborativeDocContent({
    required this.contract,
  });

  @override
  call(NoParams params) async => await contract.getCollaborativeDocContent();
}
