import 'package:nokhte/app/modules/home/domain/domain.dart';

class ExistingCollaborationsInfoModel extends ExistingCollaborationsInfoEntity {
  const ExistingCollaborationsInfoModel({
    required super.hasACollaboration,
    required super.hasDoneThePerspectivesSession,
  });

  static ExistingCollaborationsInfoModel fromSupabase(
      List collaborationRes, List perspectivesSessionRes) {
    bool hasACollaboration = true;
    bool hasDonePerspectives = true;
    if (collaborationRes.isEmpty) {
      hasACollaboration = false;
    }
    if (perspectivesSessionRes.isEmpty) {
      hasDonePerspectives = false;
    }
    return ExistingCollaborationsInfoModel(
      hasACollaboration: hasACollaboration,
      hasDoneThePerspectivesSession: hasDonePerspectives,
    );
  }
}
