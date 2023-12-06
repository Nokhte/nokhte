import 'package:nokhte/app/core/entities/default_db_status_entity.dart';

class AudioPlayingStatusEntity extends DefaultDBStatusEntity {
  const AudioPlayingStatusEntity({required bool isPlaying})
      : super(isSent: isPlaying);
}
