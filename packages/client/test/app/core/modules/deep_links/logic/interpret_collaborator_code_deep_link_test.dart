import 'package:flutter_test/flutter_test.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';

void main() {
  late InterpretCollaboratorCodeDeepLink tLogic;

  setUp(() {
    tLogic = InterpretCollaboratorCodeDeepLink();
  });

  group("call", () {
    group("hasGoneThroughInvitationFlow", () {
      test("params.userUID == params.collaboratorUID", () {
        final res = tLogic(const InterpretCollaboratorCodeDeepLinkParams(
          collaboratorUID: "userUID",
          userUID: 'userUID',
          hasGoneThroughInvitationFlow: true,
          hasSentAnInvitation: true,
          wantsToRepeatInvitationFlow: true,
          hasCompletedNoktheSession: false,
          hasEnteredStorage: false,
        ));
        expect(res, const InterpretedDeepLinkEntity());
      });

      test("params.userUID != params.collaboratorUID", () {
        final res = tLogic(const InterpretCollaboratorCodeDeepLinkParams(
          collaboratorUID: "collaboratorUID",
          userUID: 'userUID',
          hasGoneThroughInvitationFlow: true,
          hasSentAnInvitation: true,
          wantsToRepeatInvitationFlow: true,
          hasCompletedNoktheSession: false,
          hasEnteredStorage: false,
        ));
        expect(
            res,
            const InterpretedDeepLinkEntity(
              path: "/session_starters/",
              additionalMetadata: {
                "hasSentAnInvitation": true,
                "collaboratorUID": "collaboratorUID",
              },
            ));
      });
    });

    test("!hasGoneThroughInvitationFlow", () {
      final res = tLogic(const InterpretCollaboratorCodeDeepLinkParams(
          collaboratorUID: "collaboratorUID",
          userUID: 'userUID',
          hasGoneThroughInvitationFlow: false,
          hasSentAnInvitation: false,
          wantsToRepeatInvitationFlow: false,
          hasCompletedNoktheSession: false,
          hasEnteredStorage: false));
      expect(
          res,
          const InterpretedDeepLinkEntity(additionalMetadata: {
            "hasSentAnInvitation": false,
            "collaboratorUID": "collaboratorUID",
          }));
    });
  });
}
