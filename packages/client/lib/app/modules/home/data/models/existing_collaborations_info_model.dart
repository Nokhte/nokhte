import 'package:nokhte/app/modules/home/domain/domain.dart';

class ExistingCollaborationsInfoModel extends ExistingCollaborationsInfoEntity {
  const ExistingCollaborationsInfoModel({
    required super.hasACollaboration,
    required super.hasAPurpose,
    required super.hasDoneThePerspectivesSession,
  });

  factory ExistingCollaborationsInfoModel.fromSupabase({
    required List collaborationRes,
    required List perspectivesSessionRes,
    required List committedPurposeRes,
  }) {
    bool hasACollaboration = collaborationRes.isNotEmpty;
    bool hasDonePerspectives = perspectivesSessionRes.isNotEmpty;
    bool hasAPurpose = committedPurposeRes.isNotEmpty;

    return ExistingCollaborationsInfoModel(
      hasAPurpose: hasAPurpose,
      hasACollaboration: hasACollaboration,
      hasDoneThePerspectivesSession: hasDonePerspectives,
    );
  }
}
