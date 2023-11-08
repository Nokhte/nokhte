import 'package:nokhte/app/core/modules/audio_player/domain/domain.dart';
import 'package:audioplayers/audioplayers.dart';

abstract class AudioPlayerRemoteSource {
  Future<void> changeAudioPlayingStatus(ChangeAudioPlayingStatusParams params);
}

class AudioPlayerRemoteSourceImpl implements AudioPlayerRemoteSource {
  final player = AudioPlayer();

  @override
  Future<void> changeAudioPlayingStatus(
          ChangeAudioPlayingStatusParams params) async =>
      params.startPlaying
          ? await player.play(AssetSource(params.path))
          : await player.pause();
}
