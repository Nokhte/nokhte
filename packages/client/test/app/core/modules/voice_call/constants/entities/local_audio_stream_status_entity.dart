import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/modules/voice_call/domain/domain.dart';

class ConstantLocalAudioStreamStatusEntity {
  static LocalAudioStreamStatusEntity get mutedCase =>
      const LocalAudioStreamStatusEntity(isMuted: true);
  static LocalAudioStreamStatusEntity get unmutedCase =>
      const LocalAudioStreamStatusEntity(isMuted: false);
  static Either<Failure, LocalAudioStreamStatusEntity> get wrappedMutedCase =>
      Right(mutedCase);
  static Either<Failure, LocalAudioStreamStatusEntity> get wrappedUnmutedCase =>
      Right(unmutedCase);
}
