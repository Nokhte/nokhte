import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class MuteLocalAudioStream
    extends AbstractFutureLogic<LocalAudioStreamStatusEntity, NoParams> {
  final VoiceCallContract contract;

  MuteLocalAudioStream({required this.contract});

  @override
  call(NoParams params) async => contract.muteLocalAudioStream();
}
