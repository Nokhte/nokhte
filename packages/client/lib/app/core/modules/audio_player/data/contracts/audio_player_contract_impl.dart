import 'package:nokhte/app/core/modules/audio_player/data/data.dart';
import 'package:nokhte/app/core/modules/audio_player/domain/domain.dart';

class AudioPlayerContractImpl implements AudioPlayerContract {
  final AudioPlayerRemoteSource remoteSource;

  AudioPlayerContractImpl({required this.remoteSource});

  @override
  Future<AudioPlayingStatusModel> changeAudioPlayingStatus(
      ChangeAudioPlayingStatusParams params) async {
    await remoteSource.changeAudioPlayingStatus(params);
    if (params.startPlaying) {
      return const AudioPlayingStatusModel(isPlaying: true);
    } else {
      return const AudioPlayingStatusModel(isPlaying: false);
    }
  }
}
