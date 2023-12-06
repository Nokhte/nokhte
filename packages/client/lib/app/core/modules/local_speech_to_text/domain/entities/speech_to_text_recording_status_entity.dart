import 'package:equatable/equatable.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/constants/constants.dart';

class SpeechToTextRecordingStatusEntity extends Equatable {
  final SpeechToTextRecordingStatus recordingStatus;

  const SpeechToTextRecordingStatusEntity({required this.recordingStatus});

  @override
  List<Object> get props => [recordingStatus];
}
