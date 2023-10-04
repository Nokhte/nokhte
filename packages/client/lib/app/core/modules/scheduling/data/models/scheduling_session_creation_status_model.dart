import 'package:primala/app/core/modules/scheduling/domain/domain.dart';

class SchedulingSessionCreationStatusModel
    extends SchedulingSessionCreationStatusEntity {
  const SchedulingSessionCreationStatusModel({required super.isCreated});

  static SchedulingSessionCreationStatusModel fromSupabase(List res) {
    return const SchedulingSessionCreationStatusModel(isCreated: true);
  }
}
