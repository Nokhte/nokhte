import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
import 'package:share_plus/share_plus.dart';

class DeepLinkSendStatusModel extends DeepLinkSendStatusEntity {
  const DeepLinkSendStatusModel({
    required super.isSent,
  });

  factory DeepLinkSendStatusModel.fromShareResult(ShareResult res) {
    if (res.status == ShareResultStatus.success) {
      return const DeepLinkSendStatusModel(isSent: true);
    } else {
      return const DeepLinkSendStatusModel(isSent: false);
    }
  }
}
