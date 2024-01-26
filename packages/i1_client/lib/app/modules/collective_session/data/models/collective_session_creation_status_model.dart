import 'package:nokhte/app/modules/collective_session/domain/domain.dart';

class CollectiveSessionCreationStatusModel
    extends CollectiveSessionCreationStatusEntity {
  const CollectiveSessionCreationStatusModel({required super.isCreated});

  static CollectiveSessionCreationStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const CollectiveSessionCreationStatusModel(isCreated: false);
    } else {
      return const CollectiveSessionCreationStatusModel(isCreated: true);
    }
  }
}
