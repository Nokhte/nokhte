import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/p2p_perspectives_session/domain/domain.dart';

class CommitThePerspectives
    implements
        AbstractFutureLogic<PerspectivesCommitStatusEntity, List<String>> {
  final P2PPerspectivesSessionContract contract;

  CommitThePerspectives({required this.contract});

  @override
  call(params) async => await contract.commitThePerspectives(params);
}
