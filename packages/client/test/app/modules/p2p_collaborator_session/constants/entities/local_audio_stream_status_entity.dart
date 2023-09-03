import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/domain/entities/entities.dart';

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
