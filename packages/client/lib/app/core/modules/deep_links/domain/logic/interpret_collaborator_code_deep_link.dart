import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';

class InterpretCollaboratorCodeDeepLink
    implements
        AbstractSyncNoFailureLogic<InterpretedDeepLinkEntity,
            InterpretCollaboratorCodeDeepLinkParams> {
  @override
  call(params) {
    if (params.hasGoneThroughInvitationFlow) {
      if (params.userUID == params.collaboratorUID) {
        return const InterpretedDeepLinkEntity();
      } else {
        return InterpretedDeepLinkEntity(
            path: "/session_starters/",
            additionalMetadata: {
              "hasSentAnInvitation": params.hasSentAnInvitation,
              "collaboratorUID": params.collaboratorUID,
            });
      }
    } else {
      return InterpretedDeepLinkEntity(additionalMetadata: {
        "hasSentAnInvitation": params.hasSentAnInvitation,
        "collaboratorUID": params.collaboratorUID,
      });
    }
  }
}

class InterpretCollaboratorCodeDeepLinkParams extends UserJourneyInfoEntity {
  final String collaboratorUID;

  const InterpretCollaboratorCodeDeepLinkParams({
    required super.hasEnteredStorage,
    required this.collaboratorUID,
    required super.hasGoneThroughInvitationFlow,
    required super.hasSentAnInvitation,
    required super.userUID,
    required super.hasCompletedNoktheSession,
  });

  factory InterpretCollaboratorCodeDeepLinkParams.fromUserJourneyInfo(
    UserJourneyInfoEntity journeyEntity,
    String collaboratorUID,
  ) =>
      InterpretCollaboratorCodeDeepLinkParams(
        hasEnteredStorage: false,
        collaboratorUID: collaboratorUID,
        hasGoneThroughInvitationFlow:
            journeyEntity.hasGoneThroughInvitationFlow,
        hasSentAnInvitation: journeyEntity.hasSentAnInvitation,
        userUID: journeyEntity.userUID,
        hasCompletedNoktheSession: journeyEntity.hasCompletedNoktheSession,
      );
}
