import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class OnlineUpdateStatusModel extends OnlineUpdateStatusEntity {
  const OnlineUpdateStatusModel({required super.isUpdated});

  static OnlineUpdateStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const OnlineUpdateStatusModel(isUpdated: false);
    } else {
      return const OnlineUpdateStatusModel(isUpdated: true);
    }
  }
}
