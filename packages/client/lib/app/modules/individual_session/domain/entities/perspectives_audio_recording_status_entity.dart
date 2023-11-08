import 'package:equatable/equatable.dart';
import 'package:nokhte/app/modules/individual_session/types/perspectives_audio_recording_status.dart';

class PerspectivesAudioRecordingStatusEntity extends Equatable {
  final PerspectivesAudioRecordingStatus recordingStatus;

  const PerspectivesAudioRecordingStatusEntity({
    required this.recordingStatus,
  });

  @override
  List<Object> get props => [
        recordingStatus,
      ];
}
