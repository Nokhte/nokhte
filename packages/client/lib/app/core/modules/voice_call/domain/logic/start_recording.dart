import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class StartRecording implements AbstractFutureLogic<bool, String> {
  final VoiceCallContract contract;

  StartRecording({required this.contract});

  @override
  call(params) async => await contract.startRecording(params);
}
