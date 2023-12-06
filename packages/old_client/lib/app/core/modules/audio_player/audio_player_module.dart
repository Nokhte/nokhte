import 'package:flutter_modular/flutter_modular.dart';
import 'package:nokhte/app/core/modules/audio_player/data/data.dart';
import 'package:nokhte/app/core/modules/audio_player/domain/domain.dart';
import 'package:nokhte/app/core/modules/audio_player/mobx/mobx.dart';

class AudioPlayerModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.singleton<AudioPlayerRemoteSourceImpl>(
          (i) => AudioPlayerRemoteSourceImpl(),
          export: true,
        ),
        Bind.singleton<AudioPlayerContractImpl>(
          (i) => AudioPlayerContractImpl(
            remoteSource: i<AudioPlayerRemoteSource>(),
          ),
          export: true,
        ),
        Bind.singleton<ChangeAudioPlayingStatus>(
          (i) => ChangeAudioPlayingStatus(
            contract: i<AudioPlayerContract>(),
          ),
          export: true,
        ),
        Bind.singleton<GetPlayerCompletionStream>(
          (i) => GetPlayerCompletionStream(
            contract: i<AudioPlayerContract>(),
          ),
          export: true,
        ),
        Bind.singleton<ChangeAudioPlayingStatusStore>(
          (i) => ChangeAudioPlayingStatusStore(
            changeAudioPlayingStatus: i<ChangeAudioPlayingStatus>(),
            getPlayerCompletionStream: i<GetPlayerCompletionStream>(),
          ),
          export: true,
        ),
      ];
}
