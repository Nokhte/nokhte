import 'package:dartz/dartz.dart';
import 'package:primala/app/core/error/failure.dart';
import 'package:primala/app/core/modules/voice_call/data/data.dart';

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
