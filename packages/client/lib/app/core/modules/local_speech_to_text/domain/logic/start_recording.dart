import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';

class StartRecording
    implements AbstractFutureLogic<RecordingStatusEntity, NoParams> {
  final LocalSpeechToTextContract contract;

  StartRecording({required this.contract});

  @override
  call(params) async => await contract.startRecording(params);
}
