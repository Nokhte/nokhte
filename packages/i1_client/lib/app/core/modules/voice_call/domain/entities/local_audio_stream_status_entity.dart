import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class LocalAudioStreamStatusEntity extends DefaultDBStatusEntity {
  const LocalAudioStreamStatusEntity({required isMuted})
      : super(isSent: isMuted);
}
