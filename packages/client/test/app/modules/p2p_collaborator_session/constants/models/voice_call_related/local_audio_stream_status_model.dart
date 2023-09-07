import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/modules/p2p_purpose_session/data/models/models.dart';

class ConstantLocalAudioStreamStatusModel {
  static LocalAudioStreamStatusModel get mutedCase =>
      const LocalAudioStreamStatusModel(isMuted: true);
  static LocalAudioStreamStatusModel get unmutedCase =>
      const LocalAudioStreamStatusModel(isMuted: false);
  static Either<Failure, LocalAudioStreamStatusModel> get wrappedMutedCase =>
      Right(mutedCase);
  static Either<Failure, LocalAudioStreamStatusModel> get wrappedUnmutedCase =>
      Right(unmutedCase);
}
