import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/collaborative_doc/domain/domain.dart';

class GetCollaboratorDelta extends AbstractFutureLogic<
    CollaborativeDocCollaboratorDeltaEntity, NoParams> {
  final P2PPurposeSessionCollaborativeDocContract contract;

  GetCollaboratorDelta({
    required this.contract,
  });

  @override
  call(NoParams params) async => await contract.getCollaboratorDelta();
}
