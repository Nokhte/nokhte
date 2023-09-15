import 'package:primala/app/core/modules/local_speech_to_text/constants/constants.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';

class RecordingStatusModel extends RecordingStatusEntity {
  const RecordingStatusModel({required super.recordingStatus});

  static RecordingStatusModel fromMicrophone(RecordingStatus res) {
    if (res == RecordingStatus.started) {
      return const RecordingStatusModel(
          recordingStatus: RecordingStatus.started);
    } else if (res == RecordingStatus.stopped) {
      return const RecordingStatusModel(
          recordingStatus: RecordingStatus.stopped);
    } else {
      return const RecordingStatusModel(recordingStatus: RecordingStatus.error);
    }
  }
}
