import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/voice_call/domain/domain.dart';

class UnmuteLocalAudioStream
    extends AbstractFutureLogic<LocalAudioStreamStatusEntity, NoParams> {
  final VoiceCallContract contract;

  UnmuteLocalAudioStream({required this.contract});

  @override
  call(NoParams params) async => contract.unmuteLocalAudioStream();
}
