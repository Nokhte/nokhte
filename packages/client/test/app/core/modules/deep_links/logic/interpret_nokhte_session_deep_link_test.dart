import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';

void main() {
  group('InterpretNokhteSessionDeepLink', () {
    test(
        'should return InterpretedDeepLinkEntity with correct path and metadata',
        () {
      // Arrange
      final logic = InterpretNokhteSessionDeepLink();
      const params = InterpretNokhteSessionDeepLinkParams(
        deepLinkUID: 'exampleDeepLinkUID',
        usersUID: 'exampleUsersUID',
      );

      // Act
      final result = logic.call(params);

      // Assert
      expect(result.path, '/collaboration/');
      expect(result.additionalMetadata, {
        'isTheUsersInvitation': false,
        "deepLinkUID": "exampleDeepLinkUID",
      });
    });
  });

  group('InterpretNokhteSessionDeepLinkParams', () {
    test('should create instance with correct isTheUsersInvitation value', () {
      // Arrange
      const params = InterpretNokhteSessionDeepLinkParams(
        deepLinkUID: 'exampleDeepLinkUID',
        usersUID: 'exampleDeepLinkUID',
      );

      // Act
      final isTheUsersInvitation = params.isTheUsersInvitation;

      // Assert
      expect(isTheUsersInvitation, true);
    });

    test('should have correct props', () {
      // Arrange
      const params1 = InterpretNokhteSessionDeepLinkParams(
        deepLinkUID: 'id1',
        usersUID: 'id1',
      );
      const params2 = InterpretNokhteSessionDeepLinkParams(
        deepLinkUID: 'id3',
        usersUID: 'id4',
      );

      // Act

      // Assert
      expect(params1.isTheUsersInvitation, true);
      expect(params2.isTheUsersInvitation, false);
    });
  });
}
