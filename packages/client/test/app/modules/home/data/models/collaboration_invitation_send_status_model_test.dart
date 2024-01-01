import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/modules/home/data/models/models.dart';
import 'package:share_plus/share_plus.dart';

void main() {
  test("`fromShareResult` should return a proper entity with success", () {
    final res = CollaborationInvitationSendStatusModel.fromShareResult(
        const ShareResult("", ShareResultStatus.success));
    expect(res, const CollaborationInvitationSendStatusModel(isSent: true));
  });

  test("`fromShareResult` should return a proper entity with dismissed", () {
    final res = CollaborationInvitationSendStatusModel.fromShareResult(
        const ShareResult("", ShareResultStatus.dismissed));
    expect(res, const CollaborationInvitationSendStatusModel(isSent: false));
  });
}
