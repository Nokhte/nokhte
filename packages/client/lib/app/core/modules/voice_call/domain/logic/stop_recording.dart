import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';

class StopRecording implements AbstractFutureLogic<bool, NoParams> {
  final VoiceCallContract contract;

  StopRecording({required this.contract});

  @override
  call(params) async => await contract.stopRecording(params);
}
