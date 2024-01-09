import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/domain/domain.dart';
import 'package:nokhte/app/core/modules/user_information/domain/domain.dart';

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
            path: "/collaboration/",
            additionalMetadata: {
              "hasSentAnInvitation": params.hasSentAnInvitation,
              "collaboratorUID": params.collaboratorUID,
            });
      }
    } else {
      return const InterpretedDeepLinkEntity();
    }
  }
}

class InterpretCollaboratorCodeDeepLinkParams extends UserJourneyInfoEntity {
  final String collaboratorUID;

  const InterpretCollaboratorCodeDeepLinkParams({
    required this.collaboratorUID,
    required super.hasGoneThroughInvitationFlow,
    required super.hasSentAnInvitation,
    required super.wantsToRepeatInvitationFlow,
    required super.userUID,
  });

  factory InterpretCollaboratorCodeDeepLinkParams.fromUserJourneyInfo(
    UserJourneyInfoEntity journeyEntity,
    String collaboratorUID,
  ) =>
      InterpretCollaboratorCodeDeepLinkParams(
        collaboratorUID: collaboratorUID,
        hasGoneThroughInvitationFlow:
            journeyEntity.hasGoneThroughInvitationFlow,
        hasSentAnInvitation: journeyEntity.hasSentAnInvitation,
        wantsToRepeatInvitationFlow: journeyEntity.wantsToRepeatInvitationFlow,
        userUID: journeyEntity.userUID,
      );
}
