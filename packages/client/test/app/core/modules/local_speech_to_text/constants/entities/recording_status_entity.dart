// import 'package:equatable/equatable.dart';
// import 'package:primala/app/core/modules/local_speech_to_text/constants/constants.dart';

// class RecordingStatusEntity extends Equatable {
//   final RecordingStatus recordingStatus;

//   const RecordingStatusEntity({required this.recordingStatus});

//   @override
//   List<Object> get props => [recordingStatus];
// }

import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/constants/constants.dart';
import 'package:nokhte/app/core/modules/local_speech_to_text/domain/domain.dart';

class ConstantRecordingStatusEntity {
  static RecordingStatusEntity get successCase =>
      const RecordingStatusEntity(recordingStatus: RecordingStatus.started);
  static RecordingStatusEntity get notSuccessCase =>
      const RecordingStatusEntity(recordingStatus: RecordingStatus.initial);
  static Either<Failure, RecordingStatusEntity> get wrappedSuccessCase =>
      Right(successCase);
  static Either<Failure, RecordingStatusEntity> get wrappedNotSuccessCase =>
      Right(notSuccessCase);
}
