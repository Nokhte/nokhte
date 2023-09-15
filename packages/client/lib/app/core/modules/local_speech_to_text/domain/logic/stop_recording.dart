import 'package:primala/app/core/interfaces/logic.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';

class StopRecording
    implements AbstractFutureLogic<RecordingStatusEntity, NoParams> {
  final LocalSpeechToTextContract contract;

  StopRecording({required this.contract});

  @override
  call(params) async => await contract.stopRecording(params);
}
