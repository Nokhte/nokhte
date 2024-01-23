import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

class UnconsecratedCollaborationCheckerModel
    extends UnconsecratedCollaborationCheckerEntity {
  const UnconsecratedCollaborationCheckerModel({
    required super.hasOne,
    required super.collaboratorInfo,
  });

  factory UnconsecratedCollaborationCheckerModel.fromSupabase(
      List res, CollaboratorInfo collaboratorInfoParam) {
    if (res.isEmpty) {
      return UnconsecratedCollaborationCheckerModel(
        collaboratorInfo: CollaboratorInfo.initial(),
        hasOne: false,
      );
    } else {
      return UnconsecratedCollaborationCheckerModel(
        hasOne: true,
        collaboratorInfo: collaboratorInfoParam,
      );
    }
  }
}
