import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:nokhte/app/modules/individual_session/types/perspectives_audio_recording_status.dart';

class PerspectivesAudioRecordingStatusEntity extends Equatable {
  final PerspectivesAudioRecordingStatus recordingStatus;
  final File returnFile;

  const PerspectivesAudioRecordingStatusEntity({
    required this.recordingStatus,
    required this.returnFile,
  });

  @override
  List<Object> get props => [
        recordingStatus,
      ];
}
