import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/modules/collaboration/domain/domain.dart';

class ShareCollaborationInvitation
    implements
        AbstractFutureLogic<CollaborationInvitationSendStatusEntity, String> {
  final CollaborationContract contract;

  ShareCollaborationInvitation({
    required this.contract,
  });

  @override
  call(params) async => await contract.shareCollaborationInvitation(params);
}
