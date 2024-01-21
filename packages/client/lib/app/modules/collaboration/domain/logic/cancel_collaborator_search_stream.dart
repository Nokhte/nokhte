import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';

class CancelCollaboratorSearchStream
    extends AbstractSyncNoFailureLogic<bool, NoParams> {
  final CollaborationContract contract;

  CancelCollaboratorSearchStream({
    required this.contract,
  });

  @override
  call(params) => contract.cancelCollaboratorSearchStream(params);
}
