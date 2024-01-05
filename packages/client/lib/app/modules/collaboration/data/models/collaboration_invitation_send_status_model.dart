import 'package:nokhte/app/modules/collaboration/domain/domain.dart';
import 'package:share_plus/share_plus.dart';

class CollaborationInvitationSendStatusModel
    extends CollaborationInvitationSendStatusEntity {
  const CollaborationInvitationSendStatusModel({
    required super.isSent,
  });

  factory CollaborationInvitationSendStatusModel.fromShareResult(
      ShareResult res) {
    if (res.status == ShareResultStatus.success) {
      return const CollaborationInvitationSendStatusModel(isSent: true);
    } else {
      return const CollaborationInvitationSendStatusModel(isSent: false);
    }
  }
}
