import 'package:primala/app/core/entities/default_db_status_entity.dart';

class LocalAudioStreamStatusEntity extends DefaultDBStatusEntity {
  /// Constructs a [NameCreationStatusEntity] instance with the specified [isSent] status.
  const LocalAudioStreamStatusEntity({required isMuted})
      : super(isSent: isMuted);
}
