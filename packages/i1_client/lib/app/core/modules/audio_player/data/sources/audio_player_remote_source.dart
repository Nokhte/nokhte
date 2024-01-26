import 'package:nokhte/app/core/modules/audio_player/domain/domain.dart';
import 'package:audioplayers/audioplayers.dart';

abstract class AudioPlayerRemoteSource {
  Future<void> changeAudioPlayingStatus(ChangeAudioPlayingStatusParams params);
  Stream<void> onPlayerComplete();
}

class AudioPlayerRemoteSourceImpl implements AudioPlayerRemoteSource {
  final player = AudioPlayer();

  @override
  onPlayerComplete() => player.onPlayerComplete;

  @override
  Future<void> changeAudioPlayingStatus(
          ChangeAudioPlayingStatusParams params) async =>
      params.startPlaying
          ? await player.play(DeviceFileSource(params.path))
          : await player.pause();
}
