import 'package:dartz/dartz.dart';
import 'package:nokhte/app/core/error/failure.dart';
import 'package:nokhte/app/core/interfaces/logic.dart';
import 'package:nokhte/app/core/modules/timer/domain/domain.dart';

abstract class AbortPurposeSessionArtifactsContract extends TimerContract {
  Future<Either<Failure, void>> abortTheCollaboration(NoParams params);
  Future<Either<Failure, void>> deleteSoloDocuments(NoParams params);
  Future<Either<Failure, void>> deleteWorkingCollaborativeDocument(
      NoParams params);
}
