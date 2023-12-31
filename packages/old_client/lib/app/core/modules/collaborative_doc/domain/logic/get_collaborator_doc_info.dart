import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/collaborative_doc/domain/domain.dart';

class GetCollaboratorDocInfo extends AbstractFutureLogic<
    CollaborativeDocCollaboratorInfoEntity, NoParams> {
  final CollaborativeDocContract contract;

  GetCollaboratorDocInfo({
    required this.contract,
  });

  @override
  call(NoParams params) async => await contract.getCollaboratorDocInfo();
}
