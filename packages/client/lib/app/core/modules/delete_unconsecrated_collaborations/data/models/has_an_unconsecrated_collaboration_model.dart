import 'package:nokhte/app/core/modules/delete_unconsecrated_collaborations/domain/domain.dart';
import 'package:nokhte_backend/tables/existing_collaborations.dart';

class UnconsecratedCollaborationCheckerModel
    extends UnconsecratedCollaborationCheckerEntity {
  const UnconsecratedCollaborationCheckerModel({
    required super.hasOne,
    required super.collaboratorOneUID,
    required super.collaboratorTwoUID,
  });

  factory UnconsecratedCollaborationCheckerModel.fromSupabase(List res) {
    if (res.isEmpty) {
      return const UnconsecratedCollaborationCheckerModel(
        collaboratorOneUID: '',
        collaboratorTwoUID: '',
        hasOne: false,
      );
    } else {
      return UnconsecratedCollaborationCheckerModel(
        hasOne: true,
        collaboratorOneUID:
            res.first[ExistingCollaborationsQueries.collaboratorOne],
        collaboratorTwoUID:
            res.first[ExistingCollaborationsQueries.collaboratorTwo],
      );
    }
  }
}
