import 'package:nokhte/app/core/modules/local_speech_to_text/constants/constants.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';

class SpeechToTextRecordingStatusModel
    extends SpeechToTextRecordingStatusEntity {
  const SpeechToTextRecordingStatusModel({required super.recordingStatus});

  static SpeechToTextRecordingStatusModel fromMicrophone(
      SpeechToTextRecordingStatus res) {
    if (res == SpeechToTextRecordingStatus.started) {
      return const SpeechToTextRecordingStatusModel(
          recordingStatus: SpeechToTextRecordingStatus.started);
    } else if (res == SpeechToTextRecordingStatus.stopped) {
      return const SpeechToTextRecordingStatusModel(
          recordingStatus: SpeechToTextRecordingStatus.stopped);
    } else {
      return const SpeechToTextRecordingStatusModel(
          recordingStatus: SpeechToTextRecordingStatus.error);
    }
  }
}
