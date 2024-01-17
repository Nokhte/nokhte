import 'package:nokhte/app/core/modules/collaborator_presence/domain/domain.dart';

class MeetingIdAndTokenUpdateStatusModel
    extends MeetingIdAndTokenUpdateStatusEntity {
  const MeetingIdAndTokenUpdateStatusModel({required super.isUpdated});

  static MeetingIdAndTokenUpdateStatusModel fromSupabase(List res) {
    if (res.isEmpty) {
      return const MeetingIdAndTokenUpdateStatusModel(isUpdated: false);
    } else {
      return const MeetingIdAndTokenUpdateStatusModel(isUpdated: true);
    }
  }
}
