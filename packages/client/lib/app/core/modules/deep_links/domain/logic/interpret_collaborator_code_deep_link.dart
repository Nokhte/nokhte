import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/deep_links/deep_links.dart';
import 'package:nokhte/app/core/modules/user_information/user_information.dart';

class InterpretCollaboratorCodeDeepLink
    implements
        AbstractSyncNoFailureLogic<InterpretedDeepLinkEntity,
            InterpretCollaboratorCodeDeepLinkParams> {
  @override
  call(params) => InterpretedDeepLinkEntity(
          path: "/session_starters/",
          additionalMetadata: {
            "collaboratorUID": params.collaboratorUID,
          });
}

class InterpretCollaboratorCodeDeepLinkParams extends UserJourneyInfoEntity {
  final String collaboratorUID;

  const InterpretCollaboratorCodeDeepLinkParams({
    required super.hasEnteredStorage,
    required this.collaboratorUID,
    required super.hasAccessedQrCode,
    required super.userUID,
    required super.hasCompletedASession,
  });

  factory InterpretCollaboratorCodeDeepLinkParams.fromUserJourneyInfo(
    UserJourneyInfoEntity journeyEntity,
    String collaboratorUID,
  ) =>
      InterpretCollaboratorCodeDeepLinkParams(
        hasEnteredStorage: false,
        collaboratorUID: collaboratorUID,
        hasAccessedQrCode: journeyEntity.hasAccessedQrCode,
        userUID: journeyEntity.userUID,
        hasCompletedASession: journeyEntity.hasCompletedASession,
      );
}
