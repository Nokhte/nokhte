import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/audio_player/domain/domain.dart';

class ChangeAudioPlayingStatus
    implements
        AbstractNoFailureAsyncLogic<AudioPlayingStatusEntity,
            ChangeAudioPlayingStatusParams> {
  final AudioPlayerContract contract;

  ChangeAudioPlayingStatus({required this.contract});

  @override
  call(params) async => await contract.changeAudioPlayingStatus(params);
}

class ChangeAudioPlayingStatusParams extends Equatable {
  final String path;
  final bool startPlaying;

  const ChangeAudioPlayingStatusParams({
    required this.path,
    required this.startPlaying,
  });

  @override
  List<Object> get props => throw UnimplementedError();
}
