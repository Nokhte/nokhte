import 'package:primala/app/core/modules/local_speech_to_text/constants/constants.dart';
import 'package:primala/app/core/modules/local_speech_to_text/domain/domain.dart';

class RecordingStatusModel extends RecordingStatusEntity {
  const RecordingStatusModel({required super.recordingStatus});

  static RecordingStatusModel fromSupabase(RecordingStatus res) {
    if (res == RecordingStatus.started) {
      return const RecordingStatusModel(
          recordingStatus: RecordingStatus.started);
    } else {
      return const RecordingStatusModel(
          recordingStatus: RecordingStatus.stopped);
    }
  }
}
