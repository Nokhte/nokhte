import 'package:nokhte/app/core/modules/audio_player/domain/domain.dart';

abstract class AudioPlayerContract {
  Future<AudioPlayingStatusEntity> changeAudioPlayingStatus(
      ChangeAudioPlayingStatusParams params);
}
