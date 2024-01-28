import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/modules/deep_links/constants/constants.dart';

void main() {
  group('NokhteSessionInvitationInformation', () {
    test(
        'should return BranchUniversalObjectAndLinkProperties with correct values',
        () {
      // Arrange
      const senderUID = 'exampleSenderUID';
      const nokhteSessionInvitationInformation =
          NokhteSessionInvitationInformation(senderUID: senderUID);

      // Act
      final result =
          nokhteSessionInvitationInformation.getBranchLinkProperties();

      // Assert
      expect(result.universalObject.canonicalIdentifier,
          "${DeepLinkPrefixes.nokhteCode}/$senderUID");
      expect(result.universalObject.title, "Join Nokhte Session");
      expect(result.universalObject.imageUrl, DeepLinkConstants.nokhteImageURL);
      expect(result.linkProperties.alias,
          "${DeepLinkPrefixes.nokhteCode}/$senderUID");
      expect(result.linkProperties.feature, "nokhte_session");
      expect(result.linkProperties.stage, "new invitation");
    });

    test('should have correct props', () {
      // Arrange
      const senderUID = 'exampleSenderUID';
      const nokhteSessionInvitationInformation =
          NokhteSessionInvitationInformation(senderUID: senderUID);

      // Act
      final props = nokhteSessionInvitationInformation.props;

      // Assert
      expect(props, [senderUID]);
    });
  });
}
