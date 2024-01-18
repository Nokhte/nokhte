import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';

class CheckForUnconsecratedCollaboration
    implements
        AbstractFutureLogic<UnconsecratedCollaborationCheckerEntity, NoParams> {
  final DeleteUnconsecratedCollaborationsContract contract;

  CheckForUnconsecratedCollaboration({required this.contract});

  @override
  call(params) async =>
      await contract.checkForUnconsecratedCollaboration(params);
}
