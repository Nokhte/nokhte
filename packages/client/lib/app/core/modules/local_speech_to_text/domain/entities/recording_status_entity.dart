import 'package:equatable/equatable.dart';
import 'package:primala/app/core/modules/local_speech_to_text/constants/constants.dart';

class RecordingStatusEntity extends Equatable {
  final RecordingStatus recordingStatus;

  const RecordingStatusEntity({required this.recordingStatus});

  @override
  List<Object> get props => [recordingStatus];
}
