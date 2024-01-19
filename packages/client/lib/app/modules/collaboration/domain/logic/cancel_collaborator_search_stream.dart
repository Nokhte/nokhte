import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';

class CancelCollaboratorSearchStream
    extends AbstractFutureLogic<bool, NoParams> {
  final CollaborationContract contract;

  CancelCollaboratorSearchStream({
    required this.contract,
  });

  @override
  call(params) async => await contract.cancelCollaboratorSearchStream(params);
}
