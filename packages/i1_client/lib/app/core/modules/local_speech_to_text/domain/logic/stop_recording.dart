import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';

class StopRecording
    implements AbstractFutureLogic<AudioProcessingEntity, NoParams> {
  final LocalSpeechToTextContract contract;

  StopRecording({required this.contract});

  @override
  call(params) async => await contract.stopRecording(params);
}
