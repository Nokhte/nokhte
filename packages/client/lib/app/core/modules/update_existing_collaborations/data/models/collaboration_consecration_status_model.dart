import 'package:nokhte/app/core/modules/update_existing_collaborations/domain/domain.dart';

class CollaborationConsecrationStatusModel
    extends CollaborationConsecrationStatusEntity {
  const CollaborationConsecrationStatusModel({required super.isConsecrated});

  static CollaborationConsecrationStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const CollaborationConsecrationStatusModel(isConsecrated: false);
    } else {
      return const CollaborationConsecrationStatusModel(isConsecrated: true);
    }
  }
}
