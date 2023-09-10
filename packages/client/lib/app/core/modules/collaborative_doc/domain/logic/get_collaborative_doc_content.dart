import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

class GetCollaborativeDocContent
    extends AbstractFutureLogic<CollaborativeDocContentEntity, NoParams> {
  final P2PPurposeSessionCollaborativeDocContract contract;

  GetCollaborativeDocContent({
    required this.contract,
  });

  @override
  call(NoParams params) async => await contract.getCollaborativeDocContent();
}
