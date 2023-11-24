import 'package:nokhte/app/core/modules/update_existing_collaborations/domain/domain.dart';

class CollaborationActivationStatusModel
    extends CollaborationActivationStatusEntity {
  const CollaborationActivationStatusModel({required super.isActivated});
  static CollaborationActivationStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const CollaborationActivationStatusModel(isActivated: false);
    } else {
      return const CollaborationActivationStatusModel(isActivated: true);
    }
  }
}
